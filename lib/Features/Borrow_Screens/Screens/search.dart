import 'package:flutter/material.dart';
import 'package:graduation_project/Features/Entered_Screens/Widget/Our_appBar.dart';
class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
String searchQuery='';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Column(
        children: [
          const OurAppbar(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Enter your search term',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
