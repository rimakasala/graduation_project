import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/Core/Back_Arrow.dart';
import 'package:graduation_project/Core/Our_appBar.dart';
import 'package:graduation_project/viewmodels/Exam_viewmodels.dart';

import '../../../Core/constent.dart';
import '../../Entered_Screens/Screens/Home.dart';
import '../Widget/CustomOptionTile.dart';
class Semester extends StatefulWidget {
  const Semester({super.key});

  @override
  State<Semester> createState() => _SemesterState();
}
final semesterNum = SemesterViewModel();

class _SemesterState extends State<Semester> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OurAppbar(),
          const BackArrow(),
          Expanded(
            child: ListView.builder(
              itemCount: semesterNum.Semesters.length,
                itemBuilder: (context , index){
                  final semester = semesterNum.Semesters[index];
                return CustomOptionTile(
                  text: semester.name ,
                  onTap: () {
                    context.push('/Department');

                  }
                );}
                ),
          ),
        ],
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


