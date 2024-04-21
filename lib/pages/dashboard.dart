import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:public_repo/pages/Home.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:public_repo/views/customtext.dart';
import 'package:public_repo/views/filepreview.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  List<File> downloadedFiles = [];
  bool isLoading = true;
  late Map<String, dynamic> username = {};

  @override
  void initState() {
    super.initState();
    fetchUsername();
    loadDownloadedFiles();
  }

  Future<void> fetchUsername() async {
    try {
      final String? name = await getUsername();
      if (name != null) {
        setState(() {
          username['username'] = name;
        });
      }
    } catch (error) {
      print('Error fetching username: $error');
    }
  }

  Future<void> loadDownloadedFiles() async {
    try {
      final Directory? appDir = await getExternalStorageDirectory();
      if (appDir != null) {
        final List<FileSystemEntity> files = appDir.listSync();
        downloadedFiles = files.whereType<File>().toList();
        // Filter out only PDF files
        downloadedFiles = downloadedFiles.where((file) {
          return file.path.toLowerCase().endsWith('.pdf');
        }).toList();
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

  @override
  Widget build(BuildContext context) {
    return Home(
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  label: 'Hello, ${username['username']}',
                  fontWeight: FontWeight.bold,
                  fontsize: 27,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: _currentIndex,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 4),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: [
              // Replace with your carousel items
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 122, 202, 206),
                  image: DecorationImage(
                    image: AssetImage('assets/images/welcome.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue,
                  image: DecorationImage(
                    image: AssetImage('assets/images/coming.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green,
                  image: DecorationImage(
                    image: AssetImage('assets/images/laptop2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          // Optional: Indicator for current carousel index
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      _currentIndex == index ? Colors.blueAccent : Colors.grey,
                ),
              );
            }),
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(
            label: "Recently viewed papers",
            fontWeight: FontWeight.bold,
            fontsize: 24,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : downloadedFiles.isEmpty
                    ? Center(child: Text('No recent items'))
                    : ListView.builder(
                        itemCount: downloadedFiles.length > 4
                            ? 4
                            : downloadedFiles.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Dismissible(
                            key: Key(downloadedFiles[index].path),
                            onDismissed: (direction) {
                              setState(() {
                                downloadedFiles.removeAt(index);
                              });
                            },
                            background: Container(
                              color: Colors.red,
                              child: Icon(Icons.delete, color: Colors.white),
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right: 16.0),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PdfPreviewPage(
                                      pdfFiles: downloadedFiles,
                                      initialIndex: index,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: 16.0,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: ListTile(
                                  leading: Icon(Icons.picture_as_pdf),
                                  title: Text(
                                    downloadedFiles[index].path.split('/').last,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
          )
        ],
      ),
    );
  }

  Future<String?> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }
}
