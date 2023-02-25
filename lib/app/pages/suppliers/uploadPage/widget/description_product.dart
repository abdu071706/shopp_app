import 'package:flutter/material.dart';

class descriptionProduct extends StatelessWidget {
  const descriptionProduct({
    Key? key,
    required this.width,
    this.maxLenght,
    required this.hintText,
    this.contentPadding,
  }) : super(key: key);

  final double width;
  final double? contentPadding;

  final int? maxLenght;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: SizedBox(
        width: width,
        child: TextField(
          keyboardType: TextInputType.multiline,
          maxLength: maxLenght,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: contentPadding!,horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.yellow,
                  width: 2,
                )),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.yellow),
              borderRadius: BorderRadius.circular(15),
            ),
            labelText: hintText,
            labelStyle: TextStyle(color: Colors.purple),
          ),
        ),
      ),
    );
  }
}