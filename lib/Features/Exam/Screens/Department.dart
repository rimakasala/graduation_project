import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/Features/Exam/Widget/CustomOptionTile.dart';
import 'package:graduation_project/viewmodels/Exam_viewmodels.dart';

import '../../../Core/Back_Arrow.dart';
import '../../../Core/Our_appBar.dart';
import '../../../Core/constent.dart';
import '../../Entered_Screens/Screens/Home.dart';
class Department extends StatefulWidget {
  const Department({super.key});

  @override
  State<Department> createState() => _DepartmentState();
}

final departmentSelct = DepartmentSelection();

class _DepartmentState extends State<Department> {
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
                itemCount: departmentSelct.deprtment.length,
                itemBuilder: (context , index){
                  final dep = departmentSelct.deprtment[index];
                  return CustomOptionTile(
                      text: dep.name ,
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
