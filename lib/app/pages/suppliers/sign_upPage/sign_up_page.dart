import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopp_app/app/pages/auth_widgets/snack_bar_widget.dart';
import 'package:shopp_app/app/pages/customers/auth/sign_up/widgets/camera_container.dart';
import 'package:shopp_app/app/pages/customers/auth/sign_up/widgets/login_text_widget.dart';
import 'package:shopp_app/app/pages/customers/auth/sign_up/widgets/sign_icon_widget.dart';
import 'package:shopp_app/app/pages/customers/auth/sign_up/widgets/sign_upText_widget.dart';

final TextEditingController _nameController = TextEditingController();

class SupliersSignUp extends StatefulWidget {
  SupliersSignUp({super.key});

  @override
  State<SupliersSignUp> createState() => _SupliersSignUpState();
}

class _SupliersSignUpState extends State<SupliersSignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
       CollectionReference suppliers = FirebaseFirestore.instance.collection('suppliers');

  String? _name;
  String? _email;
  String? _password;
  bool isVisibile = true;
  bool processing = false;
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  late String _profileimage;
  late String _uid;
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
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.red,
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 25, color: Colors.black),
      ),
    ));
  }

  void signUp() async {
    setState(() {
      processing = true;
    });
    if (_formKey.currentState!.validate()) {
      if (_imageFile != null) {
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email!,
            password: _password!,
          );
          firebase_storage.Reference reference = 
          firebase_storage.FirebaseStorage.instance.ref(
            'suppliers-images/$_email.jpg');
          await reference.putFile(File(_imageFile!.path));
          _uid = FirebaseAuth.instance.currentUser!.uid;
          _profileimage = await reference.getDownloadURL();
          // ignore: use_build_context_synchronously
          Navigator.pushReplacementNamed(context,'/suppliersPage');
          await suppliers.doc(_uid).set({
            'name': _name,
            'email': _email,
            'phone': '',
            'address': '',
            'profileImage': _profileimage,
            },);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            setState(() {
              processing = false;
            });
            SnackBarWidget.snackBar(
                'The password provided is too weak.', _scaffoldKey);
            log('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            setState(() {
              processing = false;
            });
            SnackBarWidget.snackBar(
                'The account already exists for that email.', _scaffoldKey);
            log('The account already exists for that email.');
          }
        } catch (e) {
          setState(() {
            processing = false;
          });
          SnackBarWidget.snackBar('$e', _scaffoldKey);
          log('$e');
        }
      } else {
        setState(() {
          _imageFile = null;
        });
        SnackBarWidget.snackBar('Please pick an image', _scaffoldKey);
      }
    } else {
      setState(() {
        processing = false;
      });
      SnackBarWidget.snackBar('Please fill your blank', _scaffoldKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        backgroundColor: Colors.black,
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
                        TextFormField(
                          style: TextStyle(color: Colors.white),
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
                              borderSide: BorderSide(
                                  color: Colors.orangeAccent, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: Colors.orange, width: 2.0),
                            ),
                            hintText: 'Please enter your full name ',
                            label: Text(
                              'Full name',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
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
                              borderSide: BorderSide(
                                  color: Colors.orangeAccent, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: Colors.orange, width: 2.0),
                            ),
                            hintText: 'Please enter your email ',
                            label: Text(
                              'Email',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
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
                              borderSide: BorderSide(
                                  color: Colors.orangeAccent, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: Colors.orange, width: 2.0),
                            ),
                            hintText: 'Please enter your password ',
                            label: Text(
                              'Password',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        HaveAccountWidget(
                          haveAccount: 'already have account?',
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context,'/suppliers_logIn');
                          },
                          registerTitle: 'Log In',
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  processing == true
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.orange,
                          ),
                        )
                      :
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