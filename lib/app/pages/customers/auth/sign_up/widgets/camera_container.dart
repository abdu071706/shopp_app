import 'package:flutter/material.dart';

class CameraContainerWidget extends StatelessWidget {
  const CameraContainerWidget({
    super.key, required this.RediusOnly, required this.icon, required this.onTap,
  });
  final BorderRadiusGeometry RediusOnly;
 final IconData icon;
 final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: RediusOnly,
          color: Colors.orange
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
