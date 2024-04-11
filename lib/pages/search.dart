import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:public_repo/pages/homeNot.dart';
import 'package:public_repo/views/customButton.dart';
import 'package:public_repo/views/customtextField.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

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
            height: 100,
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
                          child: Image.network(
                            searchResults[index].imageUrl,
                            fit: BoxFit.cover,
                          )),
                      SizedBox(height: 10),
                      Text(
                        searchResults[index].description,
                        style: TextStyle(fontSize: 16),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          downloadImage(searchResults[index].imageUrl);
                        },
                        child: Text("Download"),
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

  Widget _buildContent(SearchResult result) {
    if (result.imageUrl.toLowerCase().endsWith('.pdf')) {
      return Text('PDF: ${result.imageUrl}');
    } else {
      return Image.network(result.imageUrl);
    }
  }

  Future<void> searchItems() async {
    final String nameQuery = papernameController.text;
    final String yearQuery = paperyearController.text;

    // Encode query parameters
    final String encodedNameQuery = Uri.encodeComponent(nameQuery);
    final String encodedYearQuery = Uri.encodeComponent(yearQuery);

    final String endpoint =
        'http://10.0.2.2:8000/student/search?name=$encodedNameQuery&year=$encodedYearQuery';

    try {
      final http.Response response = await http.get(Uri.parse(endpoint));
      print(response.body);
      if (response.statusCode == 200) {
        // Handle successful response
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          // Update the searchResults list with parsed data
          searchResults =
              data.map((json) => SearchResult.fromJson(json)).toList();
        });
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
        print('Image downloaded successfully');
      } else {
        print('Unable to get external storage directory');
      }
    } catch (error) {
      print('Error downloading image: $error');
    }
  }
}

class SearchResult {
  final String imageUrl;
  final String description;

  SearchResult({required this.imageUrl, required this.description});

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      imageUrl: json['image'],
      description: json['name'],
    );
  }
}
