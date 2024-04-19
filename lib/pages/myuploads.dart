import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:public_repo/pages/homeNot.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyUploads extends StatefulWidget {
  const MyUploads({Key? key}) : super(key: key);

  @override
  State<MyUploads> createState() => _MyUploadsState();
}

class _MyUploadsState extends State<MyUploads> {
  late String _accessToken;
  List<UploadedFile> uploadedFiles = [];

  @override
  void initState() {
    super.initState();
    _loadAccessToken();
    
  }

  Future<void> _loadAccessToken() async {
    String? token = await _getAccessToken();
    if (token != null) {
      setState(() {
        _accessToken = token;
      });
      fetchUploadedFiles();
    } else {
      // Handle error
      print('Access token not found');
    }
  }

  Future<String?> _getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  Future<void> fetchUploadedFiles() async {
    final apiUrl = 'http://10.0.2.2:8000/student/myuploads/';
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization':
              'Bearer $_accessToken', // Include access token in headers
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        setState(() {
          uploadedFiles =
              data.map((item) => UploadedFile.fromJson(item)).toList();
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

  Future<void> updateUploadedFile(int index) async {
    final file = uploadedFiles[index];
    // Implement logic to update uploaded file
  }

  Future<void> deleteUploadedFile(int index) async {
    final file = uploadedFiles[index];
    // Implement logic to delete uploaded file
  }

  @override
  Widget build(BuildContext context) {
    return Home_No_app(
      body: Column(
        children: [
          Container(
            height: 100,
            color: Color.fromARGB(255, 39, 176, 171),
          ),
          SizedBox(height: 20),
          // Display uploaded files
          Expanded(
            child: ListView.builder(
              itemCount: uploadedFiles.length,
              itemBuilder: (context, index) {
                final file = uploadedFiles[index];
                return ListTile(
                  title: Text(file.fileName),
                  subtitle: Text(file.filePath),
                  // Add buttons for update and delete
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => updateUploadedFile(index),
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () => deleteUploadedFile(index),
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UploadedFile {
  final String fileName;
  final String filePath;

  UploadedFile({required this.fileName, required this.filePath});

  factory UploadedFile.fromJson(Map<String, dynamic> json) {
    return UploadedFile(
      fileName: json['fileName'],
      filePath: json['filePath'],
    );
  }
}
