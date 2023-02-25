import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopp_app/app/pages/constants_colors/AppColors.dart';
import 'package:shopp_app/app/pages/customers/main_pages/profile/profile_page.dart';
import 'package:shopp_app/app/pages/home_page/home_page.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  int _selectedIndex = 0;
  final List<Widget> _tabs = [
    Home_page(),
    Center(child: Text('Category Screen')),
    Center(child: Text('Stores Screen')),
    Center(child: Text('Cart Screen')),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.grey[400],
        backgroundColor: AppColors.green,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: AppColors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Category',
              backgroundColor: AppColors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: 'Stores',
              backgroundColor: AppColors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
              backgroundColor: AppColors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: AppColors.green),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
