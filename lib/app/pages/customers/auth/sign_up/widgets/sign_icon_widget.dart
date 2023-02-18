import 'package:flutter/material.dart';

class SignUpIconhomeWidget extends StatelessWidget {
  const SignUpIconhomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Sign Up',
          
          style: TextStyle(color: Colors.white,
              fontSize: 35, fontWeight: FontWeight.bold),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.home_work,
              size: 35,
              color: Colors.white,
            ))
      ],
    );
  }
}