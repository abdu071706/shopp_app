import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.search,
            size: 40,
            color: Colors.grey[600],
          ),
          Text(
            'What are you looking?',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey[600]
            ),
            ),
          
          Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text(
                'Search',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
