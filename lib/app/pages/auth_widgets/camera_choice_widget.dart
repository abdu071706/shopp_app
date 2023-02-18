import 'package:flutter/material.dart';

class CameraChoiceWidget extends StatelessWidget {
  const CameraChoiceWidget({
    super.key,
    required this.radiusOnly,
    required this.icon,
    required this.onTap,
  });
  final BorderRadiusGeometry radiusOnly;
  final IconData icon;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: radiusOnly,
          color: Colors.purpleAccent,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(
            icon,
            size: 25,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}