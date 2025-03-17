import 'package:flutter/material.dart';
import 'package:graduation_project/Core/constent.dart';
class EnterdCard extends StatelessWidget {
  const EnterdCard({super.key, required this.card_name});
  final String card_name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      height: 163,
      margin: const EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
      decoration: BoxDecoration(
          color: blueUses,
          borderRadius: BorderRadius.circular(28)
      ),
      child: Center(
        child: Text(card_name,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 30
          ),),
      ),
    );
  }
}
