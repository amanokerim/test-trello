import 'package:flutter/material.dart';
import 'package:testtrello/presentation/const.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();

  String _username = "", _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kanban"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            child: Column(
          children: [
            SizedBox(height: 30.0),
            _buildUsernameTextFormField(),
            SizedBox(height: 20.0),
            _buildPasswordTextFormField(),
            SizedBox(height: 20.0),
            _buildLoginButton(context)
          ],
        )),
      ),
    );
  }

  Container _buildLoginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        color: myPrimaryColor,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Center(
          child: Text(
        "Log in",
        style: Theme.of(context).textTheme.button.copyWith(color: Colors.black),
      )),
    );
  }

  TextFormField _buildPasswordTextFormField() {
    return TextFormField(
      key: _passwordKey,
      obscureText: true,
      textAlign: TextAlign.center,
      decoration: myLoginDecoration.copyWith(hintText: "Enter your password"),
      cursorColor: myPrimaryColor,
      validator: (v) {
        if (_password.length < 8) return "Minimum is 8 characters";
        return null;
      },
      onChanged: (v) {
        setState(() => _password = v);
        _passwordKey.currentState.validate();
      },
    );
  }

  TextFormField _buildUsernameTextFormField() {
    return TextFormField(
      key: _usernameKey,
      autofocus: true,
      textAlign: TextAlign.center,
      decoration: myLoginDecoration.copyWith(hintText: "Enter your username"),
      cursorColor: myPrimaryColor,
      validator: (v) {
        if (_username.length < 4) return "Minimum is 4 characters";
        return null;
      },
      onChanged: (v) {
        setState(() => _username = v);
        _usernameKey.currentState.validate();
      },
    );
  }
}
