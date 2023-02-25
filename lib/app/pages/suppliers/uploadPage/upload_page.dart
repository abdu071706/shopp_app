import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shopp_app/app/pages/auth_widgets/snack_bar_widget.dart';
import 'package:shopp_app/app/pages/suppliers/uploadPage/widget/description_product.dart';

class UploadPage extends StatefulWidget {
  UploadPage({Key? key}) : super(key: key);
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  XFile? _imageFile;
  final _globalkey = GlobalKey<FormState>();
  dynamic _pickedImageError;
  final ImagePicker _picker = ImagePicker();

  void _pickImageFromCamera() async {
    try {
      final _pickedImage = await _picker.pickImage(
        source: ImageSource.camera,
        maxHeight: 2400,
        maxWidth: 200,
        imageQuality: 95,
      );

      setState(() {
        _imageFile = _pickedImage;
      });
    } catch (e) {
      setState(() {
        _pickedImageError = e;
      });

      log('image error $_pickedImageError');
    }
  }

  void _pickImageFromGallery() async {
    try {
      final _pickedImage = await _picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 240,
        maxWidth: 200,
        imageQuality: 95,
      );

      setState(() {
        _imageFile = _pickedImage;
      });
    } catch (e) {
      setState(() {
        _pickedImageError = e;
      });

      log('image error $_pickedImageError');
    }
  }

  void _completeUpload() {
    if (_imageFile != null) {
    } else {
      setState(() {
        _imageFile = null;
      });
      SnackBarWidget.snackBar("Please Upload Photo", _globalkey);
    }
  }

  String? value;
  String? Subvalue;

  final selectedCategory = [
    "Men ",
    "Women ",
    "Accessories ",
    "Shoes ",
    "Bags ",
    'Kids ',
    'Home & garden ',
    'Electronics ',
    'Beauty ',
  ];
  final selectedSubCategory = [
    "Phone",
    "Laptop",
    "Other SubCategory",
    "TV",
    "Android",
    "Iphone",
    'Xioami',
    'Poco',
    'Samsung',
    'LG',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalkey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () async {
                            showModalBottomSheet(
                              context: context,
                              builder: ((builder) => bottomSheet()),
                            );
                            print('Tappppes');
                          },
                          child: Container(
                            width: 200,
                            height: 240,
                            decoration: BoxDecoration(color: Colors.grey),
                            child: Text("Please Upload Photo"),
                          )),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "* select main category",
                              style: TextStyle(color: Colors.red),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: DropdownButton(
                                hint: Text("  Select"),
                                borderRadius: BorderRadius.circular(10),
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.red,
                                ),
                                value: value,
                                onChanged: ((value) =>
                                    setState(() => this.value = value)),
                                items: selectedCategory
                                    .map(buildMenuItem)
                                    .toList(),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "* select sub category",
                                  style: TextStyle(color: Colors.red),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[400],
                                  ),
                                  child: DropdownButton(
                                    hint: Text("  Select"),
                                    focusColor: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.red,
                                    ),
                                    value: Subvalue,
                                    onChanged: ((value) =>
                                        setState(() => this.Subvalue = value)),
                                    items: selectedSubCategory
                                        .map(buildMenuItems)
                                        .toList(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.yellow,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: descriptionProduct(
                            contentPadding: 20,
                            hintText: "Price",
                            width: 180,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: descriptionProduct(
                            contentPadding: 20,
                            hintText: "Quantity",
                            width: 200,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: descriptionProduct(
                            contentPadding: 50,
                            hintText: "Product Name",
                            width: double.infinity,
                            maxLenght: 100,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: descriptionProduct(
                            contentPadding: 80,
                            hintText: "Product Description",
                            width: double.infinity,
                            maxLenght: 800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.yellow,
            onPressed: () {},
            child: Icon(
              Icons.delete,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            backgroundColor: Colors.yellow,
            onPressed: () {},
            child: Icon(
              Icons.upload,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItems(String item) => DropdownMenuItem(
        value: item,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            item.toString(),
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      );
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            item.toString(),
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      );
  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            "Choose  Photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextButton(
              child: Column(
                children: [
                  Icon(
                    Icons.camera_alt,
                    color: Colors.black,
                  ),
                  Text(
                    "Camera",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                _pickImageFromCamera();
              },
            ),
            SizedBox(
              width: 20,
            ),
            TextButton(
              child: Column(
                children: [
                  Icon(
                    Icons.image,
                    color: Colors.black,
                  ),
                  Text(
                    "Gallery",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                _pickImageFromGallery();
              },
            ),
          ])
        ],
      ),
    );
  }
}
