import 'package:flutter/material.dart';
import 'dart:ui';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.purple[700],
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 135.0,
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                        child: Text(
                          'Exited?!',
                          style: TextStyle(
                            fontSize: 46.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                20.0, 0.0, 20.0, 10.0),
                            child: Container(
                              child: Text(
                                'You Should Be!!',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                20.0, 20.0, 20.0, 10.0),
                            child: Text(
                              'Sign in if you already have on account with US',
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 10.0,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ],
                      ),

                      //Sign in
                      Container(
                        child: Container(
                          child: FlatButton(
                            color: Colors.white,
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.purple[900].withOpacity(0.7),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            splashColor: Colors.purple[100],
                            padding:
                                EdgeInsets.fromLTRB(140.0, 20.0, 140.0, 20.0),
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 10.0),
                        child: Row(
                          children: [
                            Text(
                              'Or sign up if you are new!',
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 10.0,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Sign Up
                      Container(
                        child: Container(
                          child: FlatButton(
                            color: Colors.white,
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.purple[900].withOpacity(0.7),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            splashColor: Colors.purple[100],
                            padding:
                                EdgeInsets.fromLTRB(138.0, 20.0, 138.0, 20.0),
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
