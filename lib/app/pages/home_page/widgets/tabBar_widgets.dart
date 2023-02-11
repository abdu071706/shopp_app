import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    required this.label,
    Key? key,
   
  }) : super(key: key);
   final  String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(fontSize: 20, color: Colors.grey[600]),
    );
  }
}