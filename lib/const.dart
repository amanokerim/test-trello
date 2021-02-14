import 'package:flutter/material.dart';

const Color myPrimaryColor = Color(0xff89FDDD);

InputDecoration myLoginDecoration = InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: myPrimaryColor),
    borderRadius: BorderRadius.circular(30.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.circular(30.0),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
    borderRadius: BorderRadius.circular(30.0),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
    borderRadius: BorderRadius.circular(30.0),
  ),
  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
);

const List<String> TABS = [
  "On hold",
  "In progress",
  "Needs review",
  "Approved",
];
