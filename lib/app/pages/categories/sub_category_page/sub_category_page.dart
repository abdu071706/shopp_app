import 'package:flutter/material.dart';

class SubCategegoryPage extends StatelessWidget {
  const SubCategegoryPage({
    Key? key,
    required this.subCategName,
    required this.mainCategName,
  }) : super(key: key);
  final String subCategName;
  final String mainCategName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Center(
            child: Text('Men',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Acme',
                  fontSize: 28,
                  letterSpacing: 1.5,
                ))),
      ),
      body: Center(
        child: Text(mainCategName),
      ),
    );
  }
}