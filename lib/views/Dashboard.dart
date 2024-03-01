import 'package:flutter/material.dart';
import 'package:public_repo/views/customtext.dart';
import 'package:public_repo/configs/constants.dart';
import 'package:public_repo/views/customtextField.dart';
import 'package:public_repo/views/customButton.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 39, 124, 124),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: CustomText(
                          label: 'Welcome to PaPAR',
                          fontsize: 30,
                          fontWeight: FontWeight.bold,
                          labelcolor: appWhiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 50),
                  child: CustomText(
                    label: 'The Past Papers Repository',
                    fontsize: 20,
                    fontWeight: FontWeight.bold,
                    labelcolor: Color.fromARGB(255, 54, 242, 104),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: CustomText(
              label: "Recently Viewed",
              labelcolor: Color.fromARGB(255, 1, 17, 30),
              fontsize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3, //  data count
              itemBuilder: (context, index) {
                //recently viewed paper widget
                return Container(
                  margin: EdgeInsets.all(10),
                  width: 250,
                  color: Colors.grey[300],
                  child: Center(
                    child: Text('Recently Viewed $index'),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: CustomText(
              label: "Recommendations",
              labelcolor: Color.fromARGB(255, 1, 17, 30),
              fontsize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: 5, //  data count
            itemBuilder: (context, index) {
              //  recommendation widget
              return Container(
                color: Colors.grey[300],
                child: Center(
                  child: Text('Recommendation $index'),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
