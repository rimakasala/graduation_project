import 'package:flutter/material.dart';
import 'package:graduation_project/Core/constent.dart';
import 'package:graduation_project/Features/Entered_Screens/Widget/Our_appBar.dart';
import 'package:graduation_project/Features/Entered_Screens/Widget/enterd_card.dart';

import 'Scanner.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

int index = 0;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int x) {
            setState(() {
              index = x;
            });
          },
          currentIndex: index,
          selectedItemColor: blueUses,
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_outlined), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.people_alt_outlined), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: ''),
          ],
        ),
        body:  SafeArea(
            child: Stack(
          children: [
            const OurAppbar(),
             Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: const EnterdCard(card_name: 'دخول المكتبة'),
                  onTap: (){
                    Navigator.pushNamed(context, 'scanner');
                  },
                ),
                const EnterdCard(card_name: 'استعارة كتاب'),
              ],
            ),
          ],
        )));
  }
}
