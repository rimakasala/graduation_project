import 'package:flutter/material.dart';
import 'package:graduation_project/Features/Entered_Screens/Screens/EnteredScreen.dart';
import 'package:graduation_project/Features/Entered_Screens/Screens/Home.dart';
import 'package:graduation_project/Features/Entered_Screens/Screens/Scanner.dart';

import 'Core/GoRouter.dart';
import 'Features/Borrow_Screens/Screens/search.dart';
main(){
  runApp( const Graduation_Project());
}
class Graduation_Project extends StatelessWidget {
  const Graduation_Project({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
