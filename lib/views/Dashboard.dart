import 'package:flutter/material.dart';
import 'package:public_repo/views/customtext.dart';
import 'package:public_repo/configs/constants.dart';
import 'package:public_repo/views/customtextField.dart';
import 'package:public_repo/views/customButton.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: CustomText(
            label: 'PAST PAPERS REPOSITORY',
            labelcolor: appWhiteColor,
          ),
        ),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    label: 'Welcome to PAPAR',
                    fontsize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                    label: "Search for a paper", labelcolor: Colors.blue),
              ),
              CustomTextField(
                hintText: "Search by name i.e(ACS 314,....)",
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(null),
                controller: TextEditingController(),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  label: 'Search',
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomText(
                label: "Here are your Picks",
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
          ),
        ),
      ),
    );
  }
}
