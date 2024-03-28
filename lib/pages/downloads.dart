import 'package:flutter/material.dart';

import 'package:public_repo/views/customtext.dart';
import 'package:public_repo/configs/constants.dart';

class Downloads extends StatelessWidget {
  const Downloads({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 150,
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
                        label: "Your Downloads",
                        fontWeight: FontWeight.bold,
                        fontsize: 25.0,
                        labelcolor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
          height: 10,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                label: "Downloaded papers",
                labelcolor: Color.fromARGB(255, 1, 17, 30),
                fontsize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
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
