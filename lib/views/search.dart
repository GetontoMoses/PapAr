import 'package:flutter/material.dart';
import 'package:public_repo/views/customtext.dart';
import 'package:public_repo/configs/constants.dart';
import 'package:public_repo/views/customtextField.dart';
import 'package:public_repo/views/customButton.dart';
import 'package:public_repo/views/header.dart';
//import 'package:http/http.dart';
class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 320,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 39, 124, 124),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 40,
                right: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Container(
                    height: 40,
                    width: 40,
                    color: const Color.fromRGBO(250, 250, 250, 0.1),
                    child: const Icon(
                      Icons.notification_add_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: CustomText(
                        label: "Search for a paper",
                        fontWeight: FontWeight.bold,
                        fontsize: 25.0,
                        labelcolor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: "Enter name i.e(ACS 314....)",
                            hintColor: Colors.white,
                            prefixIcon: Icon(Icons.search, color: Colors.white),
                            suffixIcon: Icon(null),
                            controller: TextEditingController(),
                            borderColor: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 3),
                          child: CustomButton(
                            label: 'Search',
                            buttonColor: Color.fromARGB(255, 68, 117, 70),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        CustomText(
          label: "Search Results",
          labelcolor: Color.fromARGB(255, 1, 17, 30),
          fontsize: 30,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 100,
              width: 100,
              color: Color.fromARGB(255, 173, 183, 191),
              child: Center(
                child: CustomText(
                  label: 'Sample Paper',
                  labelcolor: appWhiteColor,
                ),
              ),
            ),
            Container(
              height: 100,
              width: 100,
              color: Color.fromARGB(255, 173, 183, 191),
              child: Center(
                child: CustomText(
                  label: 'Sample Paper',
                  labelcolor: appWhiteColor,
                ),
              ),
            ),
            Container(
              height: 100,
              width: 100,
              color: Color.fromARGB(255, 173, 183, 191),
              child: Center(
                child: CustomText(
                  label: 'Sample Paper',
                  labelcolor: appWhiteColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
