import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:public_repo/pages/myuploads.dart';

class UploadDetail extends StatefulWidget {
  final int uploadId;

  UploadDetail({required this.uploadId});

  @override
  _UploadDetailScreenState createState() => _UploadDetailScreenState();
}

class _UploadDetailScreenState extends State<UploadDetail> {
  late TextEditingController _nameController;
  late TextEditingController _yearController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _yearController = TextEditingController();
    _fetchUploadDetails();
  }

  Future<void> _fetchUploadDetails() async {
    final apiUrl =
        'http://10.0.2.2:8000/student/myuploadscrud/${widget.uploadId}/';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _nameController = TextEditingController(text: data['name']);
        _yearController = TextEditingController(text: data['year']);
      });
    } else {
      // Handle error
      print('Failed to fetch upload details: ${response.statusCode}');
    }
  }

  Future<void> _updateUpload() async {
    final updatedData = {
      'name': _nameController.text,
      'year': _yearController.text,
    };

    final apiUrl =
        'http://10.0.2.2:8000/student/myuploadscrud/${widget.uploadId}/';
    final jsonData = jsonEncode(updatedData);

    final response = await http.patch(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonData,
    );

    if (response.statusCode == 200) {
      // Upload updated successfully
  
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text('Record updated successfully')),
          );
        },
      );

      // Delay navigation to dashboard by 2 seconds (adjust as needed)
      await Future.delayed(Duration(seconds: 1));
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyUploads()));
       // Navigate back and indicate success
    } else {
      // Handle error
      print('Failed to update upload: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Upload'),
      ),
      body: _nameController != null && _yearController != null
          ? Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextFormField(
                    controller: _yearController,
                    decoration: InputDecoration(labelText: 'Year'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _updateUpload,
                    child: Text('Save Changes'),
                  ),
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
