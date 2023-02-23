import 'package:flutter/material.dart';

class HaveAccountWidget extends StatelessWidget {
  const HaveAccountWidget({
    super.key,
    required this.haveAccount,
    required this.onTap,
    required this.registerTitle,
  });
  final String haveAccount;
  final Function() onTap;
  final String registerTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          haveAccount,
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            registerTitle,
            style: TextStyle(
                fontSize: 20,
                color: Colors.orange,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}