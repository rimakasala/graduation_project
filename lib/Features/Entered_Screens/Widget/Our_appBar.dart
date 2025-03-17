import 'package:flutter/material.dart';

class OurAppbar extends StatelessWidget {
  const OurAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: const BoxDecoration(
          border: Border(
        top: BorderSide(color: Colors.grey, width: 1),
        bottom: BorderSide(color: Colors.grey, width: 1),
      )
      ),
      child: AppBar(
        centerTitle: true,
        title: const Text(
          'Fci-Zu Library',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton<String>(
              onSelected: (String result) {
                print('Selected: $result');
              },
              icon: const Icon(Icons.menu),
              color: Colors.white,
              // shadowColor: Colors.grey,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'الملف الشخصي',
                      child: const Text('الملف الشخصي'),
                      onTap: () {},
                    ),
                    PopupMenuItem<String>(
                      value: 'الإشعارات',
                      child: const Text('الإشعارات'),
                      onTap: () {},
                    ),
                    PopupMenuItem<String>(
                      value: 'كل الكتب',
                      child: const Text('كل الكتب'),
                      onTap: () {},
                    ),
                    PopupMenuItem<String>(
                      value: 'قراءه كتاب',
                      child: const Text('قراءه كتاب'),
                      onTap: () {},
                    ),
                    PopupMenuItem<String>(
                      value: 'إستعاره كتاب',
                      child: const Text('إستعاره كتاب'),
                      onTap: () {},
                    ),
                    PopupMenuItem<String>(
                      value: 'إعادة كتاب',
                      child: const Text('إعادة كتاب'),
                      onTap: () {},
                    ),
                    PopupMenuItem<String>(
                      value: 'الكتب المفضلة',
                      child: const Text('الكتب المفضلة'),
                      onTap: () {},
                    ),
                    PopupMenuItem<String>(
                      value: 'قائمة القراءه',
                      child: const Text('قائمة القراءه'),
                      onTap: () {},
                    ),
                    PopupMenuItem<String>(
                      value: 'إختبارات سابقه',
                      child: const Text('إختبارات سابقه'),
                      onTap: () {},
                    ),
                    PopupMenuItem<String>(
                      value: 'مشاريع التخرج',
                      child: const Text('مشاريع التخرج'),
                      onTap: () {},
                    ),
                    PopupMenuItem<String>(
                      value: 'تسجيل الخروج',
                      child: const Text('تسجيل الخروج'),
                      onTap: () {},
                    ),
                  ]
          )
        ],
      ),
    );
  }
}
