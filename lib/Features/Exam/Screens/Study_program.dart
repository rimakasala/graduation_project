import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/Core/Back_Arrow.dart';
import 'package:graduation_project/Core/Our_appBar.dart';
import 'package:graduation_project/Features/Exam/Widget/CustomOptionTile.dart';
import 'package:graduation_project/viewmodels/Exam_viewmodels.dart';

import '../../../Core/constent.dart';
import '../../Entered_Screens/Screens/Home.dart';
class StudyProgram extends StatefulWidget {
  const StudyProgram({super.key});

  @override
  State<StudyProgram> createState() => _StudyProgramState();
}

final StudyProgramView =StudyProgramViewModels();

class _StudyProgramState extends State<StudyProgram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OurAppbar(),
          BackArrow(),
          Expanded(
            child: ListView.builder(
              itemCount: StudyProgramView.programs.length,
                   itemBuilder : (context, index){
                     final program = StudyProgramView.programs[index];
                     return CustomOptionTile(
                      text:program.name,
                         onTap: () {
                           context.push('/AcademicYear', extra: program.id);
                         }
                     );
                   }
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
