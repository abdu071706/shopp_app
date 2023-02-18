import 'package:flutter/material.dart';

class SnackBarWidget {
  static void snackBar(String text, var _scaffoldKey) {
    _scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        duration: Duration(seconds: 4),
        backgroundColor: Colors.yellow,
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}