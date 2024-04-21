import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:public_repo/pages/details.dart';
import 'package:public_repo/pages/homeNot.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyUploads extends StatefulWidget {
  const MyUploads({Key? key}) : super(key: key);

  @override
  State<MyUploads> createState() => _MyUploadsState();
}

class _MyUploadsState extends State<MyUploads> {
  List<dynamic> uploadedFiles = [];

  @override
  void initState() {
    super.initState();
    fetchUploadedFiles();
  }

  Future<void> fetchUploadedFiles() async {
    int? userId = await getUserId();
    final apiUrl = 'http://10.0.2.2:8000/student/myuploads/$userId/';
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        print('Fetched data: $data');
        setState(() {
          uploadedFiles = data;
        });
      } else {
        // Handle error
        print('Failed to fetch uploaded files: ${response.statusCode}');
      }
    } catch (error) {
      // Handle error
      print('Error fetching uploaded files: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Home_No_app(
      body: Column(
        children: [
          Container(
            height: 100,
            color: Color.fromARGB(255, 39, 176, 171),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'My Uploads',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: uploadedFiles.length,
              itemBuilder: (context, index) {
                final file = uploadedFiles[index];
                return ListTile(
                  title: Text(file['name']),
                  subtitle: Text(file['year']),
                  // onTap to handle file selection
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UploadDetail(
                         uploadId: file['id'],
                        ),
                      ),
                    );
                    print(file['id']);
                  },
                  trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to edit screen
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UploadDetail(
                              uploadId: file['id'],
                            ),
                          ),
                        );
                      },
                      child: Text('Edit'),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Delete the item
                        deleteUploadedFile(file['id']);
                      },
                      child: Text('Delete'),
                    ),
                  ]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> deleteUploadedFile(int id) async {
    final apiUrl = 'http://10.0.2.2:8000/student/myuploadscrud/$id/';
    try {
      final response = await http.delete(
        Uri.parse(apiUrl),
      );

      if (response.statusCode == 200) {
        // Item deleted successfully from backend
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Item Deleted"),
              content: Text("Item deleted successfully"),
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
        setState(() {
          uploadedFiles.removeWhere((file) => file['id'] == id);
        });
      } else {
        // Handle error
        print('Failed to delete uploaded file: ${response.statusCode}');
      }
    } catch (error) {
      // Handle error
      print('Error deleting uploaded file: $error');
    }
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
