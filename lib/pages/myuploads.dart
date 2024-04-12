import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:public_repo/pages/homeNot.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyUploads extends StatefulWidget {
  
  const MyUploads({Key? key,}) : super(key: key);

  @override
  State<MyUploads> createState() => _MyUploadsState();
}

class _MyUploadsState extends State<MyUploads> {
  List<UploadedFile> uploadedFiles = [];

  @override
  void initState() {
    super.initState();
    // Load uploaded files when the widget initializes
    _loadUploadedFiles();
  }

  // Load uploaded files from SharedPreferences
  Future<void> _loadUploadedFiles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? filesJson = prefs.getString('uploaded_files');
    if (filesJson != null) {
      List<dynamic> jsonList = jsonDecode(filesJson);
      setState(() {
        uploadedFiles = jsonList.map((e) => UploadedFile.fromJson(e)).toList();
      });
    }
  }

  // Save uploaded files to SharedPreferences
  Future<void> _saveUploadedFiles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String filesJson = jsonEncode(uploadedFiles);
    prefs.setString('uploaded_files', filesJson);
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
          SizedBox(height:20),
          Expanded(
            child: ListView.builder(
              itemCount: uploadedFiles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(uploadedFiles[index].fileName),
                  subtitle:
                      Text(uploadedFiles[index].uploadDate.toString()),
                  
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
  final DateTime uploadDate;

  UploadedFile({
    required this.fileName,
    required this.filePath,
    required this.uploadDate,
  });

  // Convert UploadedFile object to JSON
  Map<String, dynamic> toJson() {
    return {
      'fileName': fileName,
      'filePath': filePath,
      'uploadDate': uploadDate.toIso8601String(),
    };
  }

  // Create UploadedFile object from JSON
  factory UploadedFile.fromJson(Map<String, dynamic> json) {
    return UploadedFile(
      fileName: json['fileName'],
      filePath: json['filePath'],
      uploadDate: DateTime.parse(json['uploadDate']),
    );
  }
}
