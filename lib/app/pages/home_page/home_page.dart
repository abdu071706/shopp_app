import 'package:flutter/material.dart';
import 'package:shopp_app/app/pages/home_page/widgets/search_bar.widgets.dart';
import 'package:shopp_app/app/pages/home_page/widgets/tabBar_widgets.dart';



class Home_page extends StatefulWidget {
  Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  int _selectedindex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          title: SearchBarWidget(),
          backgroundColor: Colors.white,
          bottom: TabBar(
              indicatorColor: Colors.green,
              isScrollable: true,
              indicatorWeight: 4,
              tabs: [
                TabBarWidget(label: 'Man'),
                TabBarWidget(label: 'Woman'),
                TabBarWidget(label: 'Accessories'),
                TabBarWidget(label: 'Shoes'),
                TabBarWidget(label: 'Bags'),
                TabBarWidget(label: 'Kids'),
                TabBarWidget(label: 'Home & Garden'),
                TabBarWidget(label: 'Electronics'),
                TabBarWidget(label: 'Beauty'),
              ]),
        ),
        body: Center(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.green,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: 'Category',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shop),
                label: 'Stores',
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_pin),
                label: 'Profile',
                backgroundColor: Colors.black)
          ],
          selectedItemColor: Colors.grey[600],
          unselectedItemColor: Colors.white,
          onTap: _onItemTapped,
          currentIndex: _selectedindex,
        ),
      ),
    );
  }
}