import 'package:flutter/material.dart';
import 'package:graduation_project/Core/constent.dart';
import 'package:graduation_project/Features/Entered_Screens/Widget/Our_appBar.dart';
import 'package:graduation_project/Features/Entered_Screens/Widget/enterd_card.dart';
import 'package:graduation_project/test.dart';


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
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chat_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'search');
              },
              icon: const Icon(Icons.search),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.people_alt_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.home_outlined),
              ),
              label: ''),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const OurAppbar(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 3,),
                InkWell(
                  child:
                  const EnterdCard(card_name: ' دخول المكتبة', icon: Icons.qr_code_2,),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomScannerScreen()));
                  },
                  // onTap: () {
                  //   Navigator.pushNamed(context, 'scanner');
                  // },
                ),
                const EnterdCard(card_name: 'الكتب', icon: Icons.library_books_outlined),

                InkWell(
                  child: const EnterdCard(card_name: 'الامتحانات السابقة', icon: Icons.playlist_add_check_circle_outlined),
                  onTap: () {
                    
                  },
                ),
                const EnterdCard(card_name: 'مشاريع التخرج', icon: Icons.school_outlined),
                const Spacer(flex: 1,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
