import 'package:flutter/material.dart';

class GoogleFacebookGuestWidget extends StatelessWidget {
   GoogleFacebookGuestWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.color, required this.image,
  });

  final String title;
  final Function() onTap;
  final String image;
  String? package;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            height: 60,
            child: Image(image: 
            
            AssetImage(image)),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
