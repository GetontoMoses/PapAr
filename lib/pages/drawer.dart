import 'package:flutter/material.dart';
import 'package:public_repo/views/customtext.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.85,
      child: Container(
        color: Color.fromRGBO(228, 233, 233, 1),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 45, 148, 105),
                image: DecorationImage(
                    image: AssetImage("assets/images/papar_drawer.jpeg"),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.08,
              ),
              child: ListTile(
                leading: Icon(Icons.home),
                title: CustomText(label: "Home"),
                onTap: () => Navigator.of(context).pushNamed("/dashboard"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.08,
              ),
              child: ListTile(
                leading: Icon(Icons.person_2_rounded),
                title: CustomText(label: "Profile"),
                onTap: () => Navigator.of(context).pushNamed("/profile"),
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 0.6,
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.08,
              ),
              child: ListTile(
                leading: Icon(Icons.upload_file),
                title: CustomText(label: "Upload a paper"),
                onTap: () => Navigator.of(context).pushNamed("/upload"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.08,
              ),
              child: ListTile(
                leading: Icon(Icons.download_rounded),
                title: CustomText(label: "Downloads"),
                onTap: () => Navigator.of(context).pushNamed("/downloads"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.08,
              ),
              child: ListTile(
                leading: Icon(Icons.star),
                title: CustomText(label: "Starred"),
                onTap: () => Navigator.of(context).pushNamed("/starred"),
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 0.6,
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.08,
              ),
              child: ListTile(
                leading: Icon(Icons.settings),
                title: CustomText(label: "Settings"),
                onTap: () => Navigator.of(context).pushNamed("/settings"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.08,
              ),
              child: ListTile(
                leading: Icon(Icons.info),
                title: CustomText(label: "About"),
                onTap: () => Navigator.of(context).pushNamed("/about"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.08,
              ),
              child: ListTile(
                leading: Icon(Icons.chat_bubble_outlined),
                title: CustomText(label: "Help & feedback"),
                onTap: () => Navigator.of(context).pushNamed("/help"),
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 0.6,
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.08,
              ),
              child: ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: CustomText(label: "Sign Out"),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "/");
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
