import 'package:flutter/material.dart';
import 'package:graduation_project/Features/Entered_Screens/Widget/Our_appBar.dart';
import 'package:graduation_project/Features/Entered_Screens/Widget/enterd_card.dart';
class EnteredScreen extends StatelessWidget {
  const EnteredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          OurAppbar(),
          EnterdCard(card_name: 'قراءة كتاب'),
          EnterdCard(card_name: 'إستعارة كتاب'),
        ],
      ),
    );
  }
}
