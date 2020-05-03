import 'package:duet/locator.dart';
import 'package:duet/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum AuthMode { LOGIN, SINGUP }

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthServices _authServices = locator<AuthServices>();
  final _formKey = GlobalKey<FormState>();
  String _password;
  String _email;
  String _firstName;
  String _lastName;
  AuthMode _authMode = AuthMode.LOGIN;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                CircleAvatar(radius: 80),
                SizedBox(height: 50.0),
                if (_authMode == AuthMode.SINGUP)
                  TextFormField(
                    onSaved: (value) => _firstName = value,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "First Name"),
                  ),
                if (_authMode == AuthMode.SINGUP)
                  TextFormField(
                    onSaved: (value) => _lastName = value,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "Last Name"),
                  ),
                TextFormField(
                  onSaved: (value) => _email = value,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: "Email Address"),
                ),
                TextFormField(
                  onSaved: (value) => _password = value,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password"),
                ),
                SizedBox(height: 20.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    onPressed: () async {
                      final form = _formKey.currentState;
                      form.save();
                      if (form.validate()) {
                        if (_authMode == AuthMode.LOGIN) {
                          try {
                            FirebaseUser result = await _authServices.loginUser(email: _email, password: _password);
                            print(result);
                          } on AuthException catch (error) {
                            return _buildShowErrorDialog(context, error.message);
                          } on Exception catch (error) {
                            return _buildShowErrorDialog(
                                context, error.toString());
                          }
                        } else {
                          try {
                            await _authServices.createUser(
                                    firstName: _firstName,
                                    lastName: _lastName,
                                    email: _email,
                                    password: _password);
                          } on AuthException catch (error) {
                            return _buildShowErrorDialog(context, error.message);
                          } on Exception catch (error) {
                            return _buildShowErrorDialog(
                                context, error.toString());
                          }
                        }
                      }
                    },
                    child: Text(_authMode == AuthMode.LOGIN ? 'LOGIN' : 'SIGNUP'),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 40),
                    Text(
                      _authMode == AuthMode.LOGIN
                          ? "Don't have an account ?"
                          : "Already have an account?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          _authMode != AuthMode.LOGIN
                              ? _authMode = AuthMode.LOGIN
                              : _authMode = AuthMode.SINGUP;
                        });
                      },
                      textColor: Colors.black87,
                      child: Text(_authMode != AuthMode.LOGIN
                          ? "Login"
                          : "Create Account"),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _buildShowErrorDialog(BuildContext context, _message) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          title: Text('Error Message'),
          content: Text(_message),
          actions: <Widget>[
            FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      },
      context: context,
    );
  }
}
