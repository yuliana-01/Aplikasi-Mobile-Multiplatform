import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sqflite_crud/model/todo.dart';
import 'package:sqflite_crud/repository/database_creator.dart';
import 'package:sqflite_crud/repository/repository_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseCreator().initDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Recipe',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: SqfLiteCrud(title: 'My Recipe'),
    );
  }
}

class SqfLiteCrud extends StatefulWidget {
  SqfLiteCrud({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SqfLiteCrudState createState() => _SqfLiteCrudState();
}

class _SqfLiteCrudState extends State<SqfLiteCrud> {
  final _formKey = GlobalKey<FormState>();
  Future<List<Todo>> future;
  String name;
  int id;

  @override
  initState() {
    super.initState();
    future = RepositoryServiceTodo.getAllTodos();
  }

  void readData() async {
    final todo = await RepositoryServiceTodo.getTodo(id);
    print(todo.name);
  }

  updateTodo(Todo todo) async {
    todo.name = 'please ';
    await RepositoryServiceTodo.updateTodo(todo);
    setState(() {
      future = RepositoryServiceTodo.getAllTodos();
    });
  }

  deleteTodo(Todo todo) async {
    await RepositoryServiceTodo.deleteTodo(todo);
    setState(() {
      id = null;
      future = RepositoryServiceTodo.getAllTodos();
    });
  }

  Card buildItem(Todo todo) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'name: ${todo.name}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'resep: ${todo.info}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () => updateTodo(todo),
                  child: Text('Update resep', style: TextStyle(color: Colors.white)),
                  color: Colors.green,
                ),
                SizedBox(width: 8),
                FlatButton(
                  onPressed: () => deleteTodo(todo),
                  child: Text('Delete'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  TextFormField buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'List Recipe',
        fillColor: Colors.yellow[300],
        filled: true,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
      },
      onSaved: (value) => name = value,
    );
  }

  void createTodo() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      int count = await RepositoryServiceTodo.todosCount();
      final todo = Todo(count, name, randomTodo(), false);
      await RepositoryServiceTodo.addTodo(todo);
      setState(() {
        id = todo.id;
        future = RepositoryServiceTodo.getAllTodos();
      });
      print(todo.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Recipe'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          Form(
            key: _formKey,
            child: buildTextFormField(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: createTodo,
                child: Text('Create', style: TextStyle(color: Colors.white)),
                color: Colors.green,
              ),
              RaisedButton(
                onPressed: id != null ? readData : null,
                child: Text('Read', style: TextStyle(color: Colors.white)),
                color: Colors.purple,
              ),
            ],
          ),
          FutureBuilder<List<Todo>>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(children: snapshot.data.map((todo) => buildItem(todo)).toList());
              } else {
                return SizedBox();
              }
            },
          )
        ],
      ),
    );
  }

  String randomTodo() {
    final randomNumber = Random().nextInt(4);
    String follow;
    switch (randomNumber) {
      case 1:
        follow = 'Instagram @yuliananingsih99';
        break;
      case 2:
        follow = 'Facebook @Ana';
        break;
      case 3:
        follow = 'Jangan Lupa Like dan Subscribe ya';
        break;
      default:
        follow = 'Subscribe chanel Yuliana Ningsih';
        break;
        
    }
    return follow;
  }
}