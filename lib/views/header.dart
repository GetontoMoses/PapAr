import 'package:flutter/material.dart';
import 'package:public_repo/views/customtext.dart';
import 'package:public_repo/views/customTextField.dart';
import 'package:public_repo/views/customButton.dart';

final TextEditingController textController = TextEditingController();
Widget head() {
  return Stack(
    children: [
      Column(
        children: [
          Container(
            width: double.infinity,
            height: 843,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(67, 123, 124, 1),
            ),
            child: Stack(
              children: [ 
                Padding(
                  padding: EdgeInsets.only(top: 40, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: CustomText(
                          label: "PaPAR",
                          fontWeight: FontWeight.bold,
                          fontsize: 45.0,
                          labelcolor: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: CustomText(
                          label: "The Past Papers Repository",
                          fontWeight: FontWeight.bold,
                          fontsize: 23.0,
                          labelcolor: Color.fromARGB(255, 54, 242, 104),
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
    ],
  );
}
