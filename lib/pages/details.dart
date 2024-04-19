import 'package:flutter/material.dart';
import 'package:public_repo/views/customtext.dart';

class UploadDetail extends StatefulWidget {
  final dynamic initialFile;
  final Function(dynamic) onUpdate;

  UploadDetail({
    required this.initialFile,
    required this.onUpdate,
  });

  @override
  _UploadDetailState createState() => _UploadDetailState();
}

class _UploadDetailState extends State<UploadDetail> {
  late dynamic _updatedFile;

  @override
  void initState() {
    super.initState();
    _updatedFile = widget.initialFile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_updatedFile['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            TextFormField(
              initialValue: _updatedFile['name'],
              onChanged: (value) {
                setState(() {
                  _updatedFile['name'] = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextFormField(
              initialValue: _updatedFile['year'],
              onChanged: (value) {
                setState(() {
                  _updatedFile['year'] = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Year',
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    widget.onUpdate(_updatedFile);
                    Navigator.pop(context);
                  },
                  child: Text('Save Changes'),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    // Add delete functionality here
                  },
                  child: Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
