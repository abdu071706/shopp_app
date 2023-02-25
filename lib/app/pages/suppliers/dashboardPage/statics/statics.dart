import 'package:flutter/material.dart';

class Statics extends StatefulWidget {
  const Statics({ Key? key }) : super(key: key);

  @override
  _StaticsState createState() => _StaticsState();
}

class _StaticsState extends State<Statics> {
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
              height: 300,
              width: 350,
              decoration: BoxDecoration(color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(12)),
                            child: Center(child: Text('Statics',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)),

              ),]
            ),
      ));
  }
}