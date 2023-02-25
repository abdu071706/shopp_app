import 'package:flutter/material.dart';

class EdirProfile extends StatefulWidget {
  const EdirProfile({ Key? key }) : super(key: key);

  @override
  _EdirProfileState createState() => _EdirProfileState();
}

class _EdirProfileState extends State<EdirProfile> {
  Color mainColor = const Color(0xFF232343);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: mainColor,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(12)),
              child: Text('Edit Profile',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
              ),]
            ),
      ));
  }
}