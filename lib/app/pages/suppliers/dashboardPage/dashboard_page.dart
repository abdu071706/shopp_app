import 'package:flutter/material.dart';
import 'package:shopp_app/app/pages/customers/main_pages/profile/alert_dialog/alert_dialog.dart';
import 'package:shopp_app/app/pages/suppliers/dashboardPage/balance_page.dart/balance_ui.dart';
import 'package:shopp_app/app/pages/suppliers/dashboardPage/edit_profile/edit_profile.dart';
import 'package:shopp_app/app/pages/suppliers/dashboardPage/manage_products/manage_products.dart';
import 'package:shopp_app/app/pages/suppliers/dashboardPage/my_store/my_store.dart';
import 'package:shopp_app/app/pages/suppliers/dashboardPage/orders/orders.dart';
import 'package:shopp_app/app/pages/suppliers/dashboardPage/statics/statics.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<IconData> icons = [
    Icons.store,
    Icons.shop_2_outlined,
    Icons.edit,
    Icons.settings,
    Icons.attach_money,
    Icons.show_chart,
  ];
  final List<String> label = [
    'My Store',
    'Orders',
    'Edit Profile',
    'Manage Products',
    'Balance',
    'Statics',
  ];
  final List<Widget> pages = [
    MyStore(),
    Orders(),
    EdirProfile(),
    ManageProfile(),
    BalanceUi(),
    Statics(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Dashboard",
          style:
              TextStyle(color: Colors.black, fontSize: 30, fontFamily: 'Acme'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              AlertDialogLogOut().showAlertDialog(context);
            },
            icon: Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.count(
          mainAxisSpacing: 50.0,
          crossAxisSpacing: 50.0,
          crossAxisCount: 2,
          children: List.generate(
            6,
            (index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => pages[index]),
                    ),
                  );
                },
                child: Card(
                  elevation: 20.0,
                  shadowColor: Colors.purpleAccent,
                  color: Colors.blueGrey.withOpacity(0.7),
                  child: Column(
                    children: [
                      Icon(
                        icons[index],
                        color: Colors.yellowAccent,
                        size: 50,
                      ),
                      Text(
                        label[index].toUpperCase(),
                        style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.yellowAccent,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                            fontFamily: 'Acme'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
