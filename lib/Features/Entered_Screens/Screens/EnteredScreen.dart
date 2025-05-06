import 'package:flutter/material.dart';
import 'package:graduation_project/Features/Entered_Screens/Widget/Our_appBar.dart';
import 'package:graduation_project/Features/Entered_Screens/Widget/enterd_card.dart';
class EnteredScreen extends StatelessWidget {
  const EnteredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Stack(
        children: [
          OurAppbar(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EnterdCard(card_name: 'الكتب', icon: Icons.library_books),
              EnterdCard(card_name: 'الامتحانات السابقة', icon: Icons.checklist),
              EnterdCard(card_name: 'مشاريع التخرج', icon: Icons.school_outlined),
            ],
          ),
        ],
      ),
    );
  }
}
