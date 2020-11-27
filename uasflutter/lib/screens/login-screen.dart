import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HalamanLogin extends StatefulWidget {
  @override
  _HalamanLoginState createState() => _HalamanLoginState();
}

class _HalamanLoginState extends State<HalamanLogin> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void validateInput() {
    FormState form = this.formKey.currentState;
    ScaffoldState scaffold = this.scaffoldKey.currentState;

    SnackBar message = SnackBar(
      content: Text('Data sukses tervalidasi'),
    );

    if (form.validate()) {
      scaffold.showSnackBar(message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        color: Colors.indigo[700],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 70.0,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(120.0),
              child: Image.asset(
                'assets/images/logo.jpg',
                width: 120.0,
                height: 120.0,
              ),
            ),
            Container(
              height: 25.0,
            ),
            Text('Log in',
                style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontFamily: 'Poppins')),
            Container(
              height: 30.0,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              hintText: 'Email Address'),
                          keyboardType: TextInputType.text,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'silahkan isi Email terlebih dahulu!';
                            }
                          },
                        ),
                        Container(
                          height: 10.0,
                          padding: EdgeInsets.all(5),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              hintText: 'Password'),
                          keyboardType: TextInputType.text,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Silahkan isi password terlebih dahulu!';
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 10.0,
                  ),
                  FlatButton(
                    color: Colors.green,
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w700),
                    ),
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(134.0, 18.0, 134.0, 18.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    splashColor: Colors.teal[700],
                    onPressed: validateInput,
                  ),
                ],
              ),
            ),
            Container(
              height: 15.0,
            ),
            Text(
              'Forget Password?',
              style: TextStyle(color: Colors.grey, fontFamily: 'Poppins'),
            ),
            Container(
              height: 35.0,
            ),
            Text('Register Here',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins')),
          ],
        ),
      ),
    );
  }
}
