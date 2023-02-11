import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopp_app/app/pages/register_page/widgets/camera_container.dart';
import 'package:shopp_app/app/pages/register_page/widgets/login_text_widget.dart';
import 'package:shopp_app/app/pages/register_page/widgets/sign_icon_widget.dart';
import 'package:shopp_app/app/pages/register_page/widgets/sign_upText_widget.dart';


final TextEditingController _nameController = TextEditingController();

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  String? _name;
  String? _email;
  String? _password;
  bool isVisibile = true;
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  void _pickImageFromCamera() async {
    try {
      final _pickedImage = await _picker.pickImage(
        source: ImageSource.camera,
        maxHeight: 300,
        maxWidth: 300,
        imageQuality: 95,
      );
      setState(() {
        _imageFile = _pickedImage;
      });
    } catch (e) {
      setState(() {});
    }
  }
  void _pickImageFromGallery() async {
    try {
      final _pickedImage = await _picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 300,
        maxWidth: 300,
        imageQuality: 95,
      );
      setState(() {
        _imageFile = _pickedImage;
      });
    } catch (e) {
      setState(() {});
    }
  }

  void snackBar(String text) {
    _scaffoldKey.currentState?.showSnackBar(SnackBar(
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 25, color: Colors.black),
      ),
    ));
  }
 void signUp()async{
  snackBar('please pick an image');
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState!.validate()) {
                        if(_imageFile != null){
                          try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: _email!,
    password: _password!,
  );
  Navigator.pushReplacementNamed(context, '/home_page');
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    snackBar('The password provided is too weak.');
    log('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    snackBar('The account already exists for that email.');
    log('The account already exists for that email.');
  }
} catch (e) {
  snackBar('$e');
  log('$e');
}
                        }else{
                          setState(() {
                            _imageFile =null;
                          });
                          snackBar('please fill your blank');
                          
                        }
                      }
 }
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            reverse: true,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SignUpIconhomeWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.orange,
                        backgroundImage: _imageFile == null
                            ? null
                            : FileImage(File(_imageFile!.path)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CameraContainerWidget(
                              icon: Icons.camera_alt,
                              onTap: () {
                                _pickImageFromCamera();
                              },
                              RediusOnly: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            CameraContainerWidget(
                              icon: Icons.photo,
                              onTap: () {
                                _pickImageFromGallery();
                              },
                              RediusOnly: BorderRadius.only(
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        TextFormField(style: TextStyle(color: Colors.white),
                          onChanged: (value) {
                            _name = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please fill your full Name';
                            } else {
                              //  _name = _nameController.text;
                            }
                            return null;
                          },
                           decoration: new InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: Colors.orangeAccent, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: Colors.orange, width: 2.0),
                            ),
                            hintText: 'Please enter your full name ',
                            label: Text(
                              'Full name',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(style: TextStyle(color: Colors.white),
                          onChanged: (value) {
                            _email = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please fill your Email';
                            } else if (value.isValidEmail() == false) {
                              return 'Not Valid';
                            } else if (value.isValidEmail() == true) {
                              return null;
                            }
                            return null;
                          },
                           decoration: new InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: Colors.orangeAccent,  width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: Colors.orange, width: 2.0),
                            ),
                            hintText: 'Please enter your email ',
                            label: Text(
                              'Email',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          onChanged: (value) {
                            _password = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please fill your password';
                            } else {
                              return null;
                            }
                          },
                          obscureText: isVisibile,
                           decoration: new InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: Colors.orangeAccent,  width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color:  Colors.orange, width: 2.0),
                            ),
                            hintText: 'Please enter your password ',
                            label: Text(
                              'password',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        LogInTextWidget(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      signUp();
                    },
                    child: SignUpWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(r'^([a-zA-Z0-9]+)([@])([a-zA-Z0-9]+)([\-\_\.])([a-z]{2,3})$')
        .hasMatch(this);
  }
}
