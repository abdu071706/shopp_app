
import 'package:flutter/material.dart';

class LogInTextWidget extends StatelessWidget {
  const LogInTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'already have account? ',
          style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {
            
          },
          child: Text(
            'Log In',
            style: TextStyle(
                fontSize: 20,
                color: Colors.orange,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}