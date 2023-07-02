import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/screens/category_screen.dart';
import '../models/authentication.dart';
import '/screens/home_screen.dart';

class Tabs2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  titleSpacing: 50,
                  backgroundColor: Colors.white,
                  title: RichText(
                    text: TextSpan(
                      text: "H Z ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'B A R',
                          style: TextStyle(
                            color: Colors.blue,
                            height: 2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  bottom: TabBar(indicatorColor: Colors.black, tabs: [
                    Tab(
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ]),
                ),
                body: TabBarView(
                  children: [SignupScreen1(), LoginScreen()],
                ))));
  }
}

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  Void _showErrorDialog(String msg) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Login Fail'),
        content: Text(msg),
        actions: <Widget>[
          FlatButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formkey.currentState.validate()) {
      return;
    }
    _formkey.currentState.save();
    try {
      await Provider.of<Authentication>(context, listen: false)
          .logIn(_authData['email'], _authData['password']);
      var route = new MaterialPageRoute(
        builder: (BuildContext context) => screen2(),
      );
      Navigator.of(context).push(route);
    } catch (error) {
      var errorMessage = 'Please Try Again';
      _showErrorDialog(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 120, right: 5, left: 5),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  prefixIcon: Icon(Icons.mail)),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value.isEmpty || !value.contains('@')) {
                  return 'invalid email';
                }
                return null;
              },
              onSaved: (value) {
                _authData['email'] = value;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, right: 5, left: 5),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  prefixIcon: Icon(Icons.vpn_key)),
              obscureText: true,
              validator: (value) {
                if (value.isEmpty || value.length <= 5) {
                  return 'invalid Password';
                }
                return null;
              },
              onSaved: (value) {
                _authData['password'] = value;
              },
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Padding(
            padding:
                EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20, right: 20),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: RaisedButton(
                      color: Colors.black,
                      child: Text('LOGIN',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      onPressed: () {
                        _submit();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SignupScreen1 extends StatefulWidget {
  static const routeName = '/signup';
  @override
  _SignupScreen1State createState() => _SignupScreen1State();
}

class _SignupScreen1State extends State<SignupScreen1> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  TextEditingController _passwordController = new TextEditingController();

  Map<String, String> _authData = {'email': '', 'password': ''};

  void _showErrorDialog(String msg) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('An Error Occured'),
              content: Text(msg),
              actions: <Widget>[
                FlatButton(
                  child: Text('Okay'),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                )
              ],
            ));
  }

  Future<void> _submit() async {
    if (!_formkey.currentState.validate()) {
      return;
    }
    _formkey.currentState.save();
    try {
      await Provider.of<Authentication>(context, listen: false)
          .signUp(_authData['email'], _authData['password']);
      var route = new MaterialPageRoute(
        builder: (BuildContext context) => screen2(),
      );
      Navigator.of(context).push(route);
    } catch (error) {
      var errorMessage = 'Please Try Again';
      _showErrorDialog(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 120, right: 5, left: 5),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  prefixIcon: Icon(Icons.mail)),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value.isEmpty || !value.contains('@')) {
                  return 'invalid email';
                }
                return null;
              },
              onSaved: (value) {
                _authData['email'] = value;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, right: 5, left: 5),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  prefixIcon: Icon(Icons.security)),
              obscureText: true,
              controller: _passwordController,
              validator: (value) {
                if (value.isEmpty || value.length <= 5) {
                  return 'invalid Password';
                }
                return null;
              },
              onSaved: (value) {
                _authData['password'] = value;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, right: 5, left: 5),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Confirm Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  prefixIcon: Icon(Icons.vpn_key)),
              obscureText: true,
              validator: (value) {
                if (value.isEmpty || value != _passwordController.text) {
                  return 'invalid Password';
                }
                return null;
              },
              onSaved: (value) {},
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Padding(
              padding:
                  EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20, right: 20),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: RaisedButton(
                        color: Colors.black,
                        child: Text('SIGN UP',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        onPressed: () {
                          _submit();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    ));
  }
}
