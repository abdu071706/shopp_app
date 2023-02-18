import 'package:flutter/material.dart';

class ProfileHeaderLabel extends StatelessWidget {
  const ProfileHeaderLabel({
    Key? key,
    required this.headerLabel,
  }) : super(key: key);
  final String headerLabel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ),
          Text(
            headerLabel,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}