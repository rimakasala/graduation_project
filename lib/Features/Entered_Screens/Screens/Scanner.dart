import 'package:flutter/material.dart';
import 'package:graduation_project/Features/Entered_Screens/Screens/EnteredScreen.dart';
import 'package:graduation_project/Features/Entered_Screens/Screens/Home.dart';
import 'package:graduation_project/Features/Entered_Screens/Widget/Our_appBar.dart';
import 'package:graduation_project/Features/Entered_Screens/Widget/enterd_card.dart';
class Scanner extends StatelessWidget {
  const Scanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          OurAppbar(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     IconButton(onPressed: (){
          //       Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
          //     },
          //         icon: Icon(Icons.keyboard_backspace)),
          //   ],
          // ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, 'enterd');
              },
            child: SizedBox(
              width: double.infinity,
              height: 250,
            ),
          )

        ],
      ),
    );
  }
}
