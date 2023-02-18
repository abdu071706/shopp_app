
import 'package:flutter/material.dart';

class HaveAccountWidget extends StatelessWidget {
  const HaveAccountWidget({
    super.key,
     required this.onTap, required this.haveAccount, required this.registerTitle
  });
final Function() onTap;
final String haveAccount;
final String registerTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
         haveAccount,
          style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {
            
          },
          child: Text(
             registerTitle,
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