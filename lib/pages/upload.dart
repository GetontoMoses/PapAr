import 'package:flutter/material.dart';
import 'package:public_repo/pages/homeNot.dart';
import 'package:public_repo/views/customButton.dart';
import 'package:public_repo/views/customtext.dart';
import 'package:public_repo/views/customtextField.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  bool isPasswordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController papernameController = TextEditingController();
  final TextEditingController paperyearController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Home_No_app(
        body: Stack(children: [
      Column(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
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
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: papernameController,
                          hintText: "Enter Name",
                          hintColor: Colors.white,
                          prefixIcon: Icon(Icons.book_online),
                          suffixIcon: Icon(null),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the Name';
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: paperyearController,
                          hintText: "Enter the Year",
                          hintColor: Colors.white,
                          prefixIcon: Icon(Icons.calendar_month),
                          suffixIcon: Icon(null),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the Year';
                            }

                            return null;
                          },
                        ),
                      ],
                    )),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 41, 124, 90),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.4,
                  right: MediaQuery.of(context).size.width * 0.2,
                ),
                child: CustomButton(
                  onPressed: () {
                    if (_formKey.currentState != null) {}
                  },
                  label: ("Upload"),
                  buttonColor: Color.fromARGB(255, 45, 148, 105),
                  width: 5,
                ),
              ),
            ],
          ),
        ],
      ),
      Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.26,
          left: MediaQuery.of(context).size.width * 0.04,
          right: MediaQuery.of(context).size.width * 0.04,
        ),
        child: Form(
          key: _formKey,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.4,
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
              color: Color.fromRGBO(226, 237, 235, 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [],
            ),
          ),
        ),
      ),
      Column(children: [
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.84,
            left: MediaQuery.of(context).size.width * 0.76,
          ),
          child: FloatingActionButton(
            onPressed: () {
              showUploadOptions(context);
            },
            child: Icon(Icons.add),
            backgroundColor: Color.fromARGB(255, 126, 196, 183),
            foregroundColor: Color.fromARGB(255, 251, 241, 241),
          ),
        ),
      ]),
    ]));
  }

  void showUploadOptions(BuildContext context) {
    showMenu(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20)),
      color: Color.fromARGB(255, 126, 196, 183),
      context: context,
      position: RelativeRect.fromLTRB(50, 490, 20, 5),
      items: [
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text('Take Photo'),
            onTap: () {
              // Handle taking photo
              Navigator.pop(context); // Close the menu
              // Add your logic for taking photo here
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.photo_library),
            title: Text('Access Gallery'),
            onTap: () {
              // Handle accessing gallery
              Navigator.pop(context); // Close the menu
              // Add your logic for accessing gallery here
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.close),
            title: Text('Cancel'),
            onTap: () {
              // Cancel action, do nothing
              Navigator.pop(context); // Close the menu
            },
          ),
        ),
      ],
    );
  }
}
