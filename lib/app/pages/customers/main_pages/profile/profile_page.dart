import 'package:flutter/material.dart';
import 'package:shopp_app/app/pages/customers/main_pages/profile/profile_widgets/profile_header_label_widgets.dart';
import 'package:shopp_app/app/pages/customers/main_pages/profile/profile_widgets/repeadted_listtile_widget.dart';
import 'package:shopp_app/app/pages/customers/main_pages/profile/profile_widgets/yellow_divider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final mediaSizeWidth = MediaQuery.of(context).size.width;
    final mediaSizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: [
          Container(
            height: 230,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.yellow,
                Colors.brown,
              ]),
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 0,
                centerTitle: true,
                backgroundColor: Colors.white,
                expandedHeight: 140,
                pinned: true,
                flexibleSpace: LayoutBuilder(builder: (context, ogronichenie) {
                  return FlexibleSpaceBar(
                      title: AnimatedOpacity(
                    duration: Duration(milliseconds: 200),
                    opacity: ogronichenie.biggest.height <= 120 ? 1 : 0,
                    child: Text(
                      'Account',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                    background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.yellow,
                          Colors.brown,
                        ],
                      ),
                    ),
                      child: Padding(
                      padding: const EdgeInsets.only(top: 25, left: 30),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage('assets/images/inapp/guest.jpg'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Text(
                              // 'Guest'.toUpperCase(),
                              'Guest'.toUpperCase(),

                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
             SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              ),
                            ),
                            child: GestureDetector(
                                child: SizedBox(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Center(
                                    child: Text(
                                      'Cart',
                                      style: TextStyle(
                                        color: Colors.yellow,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {}),
                          ),
                          Container(
                            color: Colors.yellow,
                            child: GestureDetector(
                                child: SizedBox(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Center(
                                    child: Text(
                                      'Orders',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {}),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                            child: GestureDetector(
                                child: SizedBox(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Center(
                                    child: Text(
                                      'Wishlist',
                                      style: TextStyle(
                                        color: Colors.yellow,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {}),
                          ),
                        ]),
                  ),
                  Container(
                    color: Colors.grey.shade300,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150,
                          child: Image(
                            image: AssetImage('assets/images/inapp/logo.jpg'),
                          ),
                        ),
                        ProfileHeaderLabel(headerLabel: ' Account Info. '),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            height: mediaSizeHeight * 0.32,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                RepeatedListTile(
                                  title: 'Email Address',

                                  subTitle: 'example@email.com',
                                  icon: Icons.email,
                                  // onPressed: () {},
                                ),
                                YellowDivider(),
                                RepeatedListTile(
                                  title: 'Phone No.',
                                  subTitle: 'Anonymous phone',
                                  icon: Icons.phone,
                                ),
                                YellowDivider(),
                                RepeatedListTile(
                                  title: 'Address',
                                  subTitle: 'Anonymous address ',
                                  icon: Icons.location_pin,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                        ProfileHeaderLabel(headerLabel: ' Account Settings '),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            height: mediaSizeHeight * 0.32,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                RepeatedListTile(
                                  title: 'EditProfile',
                                  // dfgrehtrjt
                                  // subTitle: '',
                                  icon: Icons.edit,
                                  onPressed: () {},
                                ),
                                YellowDivider(),
                                RepeatedListTile(
                                  title: 'Change Password',
                                  icon: Icons.lock,
                                  onPressed: () {},
                                ),
                                YellowDivider(),
                                RepeatedListTile(
                                    title: 'Log Out',
                                    icon: Icons.logout,
                                    onPressed: () {}),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}