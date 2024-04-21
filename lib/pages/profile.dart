import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:public_repo/pages/homeNot.dart';
import 'package:public_repo/views/customtext.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late Map<String, dynamic> userProfile = {};

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    int? userId = await getUserId();
    final url = 'http://10.0.2.2:8000/student/user/$userId/';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          userProfile = jsonDecode(response.body);
        });
      } else {
        throw Exception('Failed to load user profile');
      }
    } catch (error) {
      print('Error fetching user profile: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Home_No_app(
      body: userProfile.isNotEmpty
          ? ListView(
              children: [
                Container(
                  height: 90,
                  width: double.infinity,
                  color: Color.fromARGB(255, 90, 53, 177),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Your Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 250,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: Row(
                    children: [
                      CustomText(
                        label: 'Username: ',
                        fontWeight: FontWeight.bold,
                        fontsize: 27,
                        labelcolor: Colors.blue,
                      ),
                      CustomText(
                        label: ' ${userProfile['username']}',
                        fontWeight: FontWeight.bold,
                        fontsize: 27,
                      )
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      CustomText(
                        label: 'Email: ',
                        fontWeight: FontWeight.bold,
                        fontsize: 27,
                        labelcolor: Colors.blue,
                      ),
                      CustomText(
                        label: ' ${userProfile['email']}',
                        fontWeight: FontWeight.bold,
                        fontsize: 27,
                      )
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Future<void> saveUserId(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('userId', userId);
  }

  Future<int?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userId');
  }
}
