import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/Core/Back_Arrow.dart';
import 'package:graduation_project/Core/Our_appBar.dart';

import '../../../Core/constent.dart';
import '../../Entered_Screens/Screens/Home.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const OurAppbar(),
            const BackArrow(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'الإشعارات',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'تمت الموافقة على طلب الاستعارة توجه لأمينة المكتبة لاستلام الكتاب',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
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
