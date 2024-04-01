import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:public_repo/pages/dashboard.dart';
import 'package:public_repo/pages/downloads.dart';
import 'package:public_repo/pages/homeNot.dart';
import 'package:public_repo/pages/search.dart';
import 'package:public_repo/views/action.dart';
import 'package:public_repo/views/customButton.dart';
import 'package:public_repo/views/customtext.dart';
import 'package:public_repo/views/customtextField.dart';
import 'package:public_repo/views/fab.dart';
import 'package:file_picker/file_picker.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  File? _selectedImage;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController papernameController = TextEditingController();
  final TextEditingController paperyearController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: CustomText(
                              label: 'Upload a Paper',
                              fontsize: 25,
                              fontWeight: FontWeight.bold,
                              labelcolor: Colors.white,
                            ),
                          ),
                        ],
                      )),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 39, 106, 126),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.23,
                      right: MediaQuery.of(context).size.width * 0.05,
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: papernameController,
                        hintText: "Enter Name",
                        prefixIcon: Icon(Icons.book_online),
                        suffixIcon: Icon(null),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the Paper Name';
                          }
                          if (value.length < 6) {
                            return 'Name must be at least 6 characters long';
                          }
                          final capitalized = value.toUpperCase();

                          papernameController.text = capitalized;
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: paperyearController,
                        hintText: "Enter the Year",
                        prefixIcon: Icon(Icons.calendar_month),
                        suffixIcon: Icon(null),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the Year';
                          }
                          final RegExp regex = RegExp(
                              r'^(JANUARY|FEBRUARY|MARCH|APRIL|MAY|JUNE|JULY|AUGUST|SEPTEMBER|OCTOBER|NOVEMBER|DECEMBER)\s+\d{4}$');
                          if (!regex.hasMatch(value)) {
                            return 'Invalid format. Please enter like "AUGUST 2023"';
                          }
                          final capitalized = value.toUpperCase();

                          paperyearController.text = capitalized;
                          return null;
                        },
                        textCapitalization: TextCapitalization.characters,
                      ),
                      SizedBox(height: 10),
                      CustomButton(
                        onPressed: () {
                          if (_selectedImage != null) {
                            uploadPaper();
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Image Required"),
                                  content: Text(
                                      "Please select an image before uploading."),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("OK"),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        label: ("Upload"),
                        buttonColor: Color.fromARGB(255, 39, 106, 126),
                        width: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.08,
              left: MediaQuery.of(context).size.width * 0.03,
              right: MediaQuery.of(context).size.width * 0.03,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.42,
              width: MediaQuery.of(context).size.width * 1,
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(58, 100, 98, 0.298),
                    offset: Offset(0, 6),
                    blurRadius: 12,
                    spreadRadius: 6,
                  ),
                ],
                color: Color.fromARGB(255, 215, 228, 226),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: _selectedImage != null
                    ? Image.file(_selectedImage!)
                    : Text(
                        'No image selected',
                        style: TextStyle(fontSize: 20),
                      ),
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: ExpandableFab(children: [
        ActionButton(
          icon: const Icon(
            Icons.file_upload_sharp,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        ActionButton(
          icon: const Icon(
            Icons.photo,
            color: Colors.white,
          ),
          onPressed: () {
            getImage();
          },
        ),
        ActionButton(
          icon: const Icon(
            Icons.camera,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ], distance: 90),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: homeController.selectedPage.value,
        onTap: (index) {
          homeController.selectedPage.value = index;
          switch (index) {
            case 0:
              Get.to(() => Dashboard());
              break;
            case 1:
              Get.to(() => Search());
              break;
            case 2:
              Get.to(() => Downloads());
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_rounded),
            label: 'downloads',
          ),
        ],
      ),
    );
  }

  Future<File> getImage() async {
    final ImagePicker _picker = ImagePicker();

    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
      return _selectedImage!;
    } else {
      throw Exception('Image picking failed');
    }
  }

  void uploadPaper() {
    if (_formKey.currentState!.validate()) {
      print('Paper Name: ${papernameController.text}');
      print('Paper Year: ${paperyearController.text}');
      print('Image: $_selectedImage');
    }
  }
}
