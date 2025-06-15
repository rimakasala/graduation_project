import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/Core/constent.dart';
import 'package:graduation_project/Core/Our_appBar.dart';
import 'package:graduation_project/Features/Entered_Screens/Widget/enterd_card.dart';

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
                    context.push('/CustomScannerScreen');
                  },
                ),

                // هنا لسه هيتضافcontext.push
                const EnterdCard(card_name: 'الكتب', icon: Icons.library_books_outlined),
                // هنا لسه هيتضافcontext.push
                GestureDetector(
                    onTap: (){
                      context.push('/StudyProgram');
                    },
                    child: const EnterdCard(card_name: 'الامتحانات السابقة', icon: Icons.playlist_add_check_circle_outlined)),
                // هنا لسه هيتضافcontext.push
                const EnterdCard(card_name: 'مشاريع التخرج', icon: Icons.school_outlined),
                const Spacer(flex: 1,)
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // ده الجديد
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
                onPressed: () {
                  context.go('/');
                },
                icon: const Icon(Icons.home_outlined),
              ),
              label: ''),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () =>context.go('/search'),
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
              onPressed: () {
                context.push('/Chat');
              },
              icon: const Icon(Icons.chat_outlined),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
