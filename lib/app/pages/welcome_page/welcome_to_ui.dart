import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:shopp_app/app/pages/welcome_page/widgets/colorize_animation.dart';
import 'package:shopp_app/app/pages/welcome_page/widgets/google_facebook_guest.dart';
import 'package:shopp_app/app/pages/welcome_page/widgets/log_sign.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/inapp/lion.jpg"),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ColorizeAnimationWidget(),
              DefaultTextStyle(
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.orange,
                  fontFamily: 'Acme',
                  fontWeight: FontWeight.bold,
                ),
                child: AnimatedTextKit(repeatForever: true, animatedTexts: [
                  FlickerAnimatedText('LION Store'),
                ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                          ),
                          color: Colors.orange[800],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Suppliers only',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            ),
                            color: Colors.orange[800]),
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                SizedBox(
                                    height: 40,
                                    child: Image(
                                      image: AssetImage(
                                        "assets/images/inapp/lions.png",
                                      ),
                                      color: Colors.black,
                                    )),
                                LogSignWidget(title: 'Log In', onTap: () {}),
                                SizedBox(
                                  width: 15,
                                ),
                                LogSignWidget(title: 'Sign Up', onTap: () {}),
                              ],
                            )),
                      ),
                    ],
                  ),
                ],
              ), 
              Column(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                padding: const EdgeInsets.only(right: 220, bottom: 7),
                child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            color: Colors.orange[800],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Customers',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
              ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 70,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          color: Colors.orange[800]),
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              
                              LogSignWidget(
                                title: 'Log In',
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/cutomer_login_page');
                                },
                              ),
                              LogSignWidget(
                                title: 'Sign Up',
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/customer_sign_up_page');
                                },
                              ),
                              SizedBox(
                                  height: 40,
                                  child: Image(
                                    image: AssetImage(
                                      "assets/images/inapp/lions.png",
                                    ),
                                    color: Colors.black,
                                  )),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.orange[800],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // GoogleFacebookGuestWidget(title: 'Google', icon: Icons.google, onTap: (){}),
                    GoogleFacebookGuestWidget(
                        title: 'Google',
                        color: Colors.white,
                        image: 'assets/images/inapp/google.jpg',
                        onTap: () {}),
                    GoogleFacebookGuestWidget(
                      title: 'Facebook',
                      color: Color.fromARGB(255, 46, 79, 170),
                      onTap: () {},
                      image: 'assets/images/inapp/facebook.jpg',
                    ),
                    GoogleFacebookGuestWidget(
                      title: 'Guest',
                      color: Colors.blue,
                      onTap: () async {
                        try {
                          final userCredential =
                              await FirebaseAuth.instance.signInAnonymously();
                          print("Signed in with temporary account.");
                        } on FirebaseAuthException catch (e) {
                          switch (e.code) {
                            case "operation-not-allowed":
                              print(
                                  "Anonymous auth hasn't been enabled for this project.");
                              break;
                            default:
                              print("Unknown error.");
                          }
                        }
                      },
                      image: 'assets/images/inapp/guest.jpg',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
