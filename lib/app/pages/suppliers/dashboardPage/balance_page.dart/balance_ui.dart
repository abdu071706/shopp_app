import 'package:flutter/material.dart';

class BalanceUi extends StatefulWidget {
  const BalanceUi({ Key? key }) : super(key: key);

  @override
  _BalanceUiState createState() => _BalanceUiState();
}

class _BalanceUiState extends State<BalanceUi> {
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
              child: Center(child: Text('Balance Page',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)),
              ),]
            ),
      ));
  }
}