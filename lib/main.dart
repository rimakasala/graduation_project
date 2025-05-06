import 'package:flutter/material.dart';
import 'package:graduation_project/Features/Entered_Screens/Screens/EnteredScreen.dart';
import 'package:graduation_project/Features/Entered_Screens/Screens/Home.dart';
import 'package:graduation_project/Features/Entered_Screens/Screens/Scanner.dart';

import 'Features/Borrow_Screens/Screens/search.dart';
main(){
  runApp( const Graduation_Project());
}
class Graduation_Project extends StatelessWidget {
  const Graduation_Project({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'enterd':(context)=>const EnteredScreen(),
        'scanner': (context)=> const Scanner(),
        'search': (context)=> const Search(),

      },
      home: const Home(),

    );
  }
}
