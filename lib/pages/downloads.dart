import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:public_repo/pages/homeNot.dart';

class Downloads extends StatefulWidget {
  const Downloads({Key? key}) : super(key: key);

  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  List<File> downloadedImages = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadDownloadedImages();
  }

  @override
  void dispose() {
    super.dispose();
    // Dispose any resources here if necessary
  }

  Future<void> loadDownloadedImages() async {
    try {
      final Directory? appDir = await getExternalStorageDirectory();
      if (appDir != null) {
        final List<FileSystemEntity> files = appDir.listSync();
        downloadedImages = files.whereType<File>().toList();
      } else {
        print('Unable to get external storage directory');
      }
    } catch (error) {
      print('Error loading downloaded images: $error');
    } finally {
      setState(() {
        isLoading = false; // Update UI
      });
    }
  }

  Future<void> deleteFile(File file) async {
    try {
      await file.delete();
      setState(() {
        downloadedImages.remove(file); // Update UI
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('File deleted successfully'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (error) {
      print('Error deleting file: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Home_No_app(
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: Color.fromARGB(255, 42, 125, 148),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'Downloads',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : downloadedImages.isEmpty
                    ? Center(child: Text('No downloaded items'))
                    : ListView.builder(
                        itemCount: downloadedImages.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 16.0,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: ListTile(
                              leading: Image.file(downloadedImages[index]),
                              title: Text(
                                downloadedImages[index].path.split('/').last,
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  deleteFile(downloadedImages[index]);
                                },
                              ),
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
