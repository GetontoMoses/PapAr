import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:public_repo/pages/homeNot.dart';
import 'package:public_repo/views/customButton.dart';
import 'package:public_repo/views/customtextField.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController papernameController = TextEditingController();
  final TextEditingController paperyearController = TextEditingController();
  List<SearchResult> searchResults = [];
  @override
  Widget build(BuildContext context) {
    return Home_No_app(
      body: Column(
        children: [
          Container(
            height: 90,
            width: double.infinity,
            color: Color.fromARGB(255, 82, 171, 37),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  "Search for Papers",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            controller: papernameController,
            hintText: "Enter Name",
            prefixIcon: Icon(Icons.book_online),
            suffixIcon: Icon(null),
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            controller: paperyearController,
            hintText: "Enter the Year",
            prefixIcon: Icon(Icons.calendar_month),
            suffixIcon: Icon(null),
            textCapitalization: TextCapitalization.characters,
          ),
          SizedBox(height: 10),
          CustomButton(
            onPressed: searchItems,
            label: ("Search"),
            buttonColor: Color.fromARGB(255, 70, 173, 18),
            width: 5,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        child: searchResults[index].pdfUrl != null
                            ? SfPdfViewer.network(
                                searchResults[index].pdfUrl,
                              )
                            : Center(
                                child: Text('PDF URL is null'),
                              ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          searchResults[index].description,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            downloadImage(searchResults[index].pdfUrl);
                          },
                          child: Text("Download"),
                        ),
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

  Future<void> searchItems() async {
    final String nameQuery = papernameController.text;
    final String yearQuery = paperyearController.text;

    // Encode query parameters
    final String encodedNameQuery = Uri.encodeComponent(nameQuery);
    final String encodedYearQuery = Uri.encodeComponent(yearQuery);

    final String endpoint =
        'http://10.0.2.2:8000/student/search/?name=$encodedNameQuery&year=$encodedYearQuery';

    try {
      final http.Response response = await http.get(Uri.parse(endpoint));
      print(response.body);
      if (response.statusCode == 200) {
        // Handle successful response
        final List<dynamic> data = json.decode(response.body);

        if (mounted) {
          // Check if the widget is mounted
          setState(() {
            // Update the searchResults list with parsed data
            searchResults =
                data.map((json) => SearchResult.fromJson(json)).toList();
          });
        }
      } else {
        // Handle error response
        throw Exception('Failed to load items');
      }
    } catch (error) {
      // Handle error
      print('Error: $error');
    }
  }

  Future<void> downloadImage(String imageUrl) async {
    try {
      final Directory? appDir = await getExternalStorageDirectory();
      if (appDir != null) {
        final http.Response response = await http.get(Uri.parse(imageUrl));
        final String fileName = imageUrl.split('/').last;
        final File file = File('${appDir.path}/$fileName');
        await file.writeAsBytes(response.bodyBytes);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('File downloaded successfully'),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Unable to get external storage directory'),
            duration: Duration(seconds: 2),
            backgroundColor: Color.fromARGB(255, 230, 72, 61),
          ),
        );
      }
    } catch (error) {
      print('Error downloading image: $error');
    }
  }
}

class SearchResult {
  final String pdfUrl;
  final String description;

  SearchResult({required this.pdfUrl, required this.description});

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      pdfUrl: json['file'] ?? '',
      description: json['name'] ?? '',
    );
  }
}
