import 'package:flutter/material.dart';
import 'package:testtrello/presentation/const.dart';

class LoginScreen extends StatelessWidget {
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
            TextFormField(
              textAlign: TextAlign.center,
              decoration:
                  myLoginDecoration.copyWith(hintText: "Enter your username"),
              cursorColor: myPrimaryColor,
            ),
            SizedBox(height: 20.0),
            TextFormField(
              textAlign: TextAlign.center,
              decoration:
                  myLoginDecoration.copyWith(hintText: "Enter your password"),
              cursorColor: myPrimaryColor,
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(
                color: myPrimaryColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Center(
                  child: Text(
                "Log in",
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: Colors.black),
              )),
            )
          ],
        )),
      ),
    );
  }
}
