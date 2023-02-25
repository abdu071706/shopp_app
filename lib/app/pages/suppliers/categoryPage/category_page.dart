import 'package:flutter/material.dart';
import 'package:shopp_app/app/pages/home_page/widgets/search_bar.widgets.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: SearchBarWidget(),
        backgroundColor: Colors.grey.shade200,
      ),
    );
  }
}