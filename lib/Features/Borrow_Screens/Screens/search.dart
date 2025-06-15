// import 'package:flutter/material.dart';
// import 'package:graduation_project/Core/Our_appBar.dart';
// class Search extends StatefulWidget {
//   const Search({super.key});
//
//   @override
//   State<Search> createState() => _SearchState();
// }
//
// class _SearchState extends State<Search> {
// String searchQuery='';
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//
//       body: Column(
//         children: [
//           const OurAppbar(),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 labelText: 'Search',
//                 hintText: 'Enter your search term',
//                 prefixIcon: const Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   searchQuery = value;
//                 });
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:graduation_project/Core/Our_appBar.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String searchQuery = '';

  // ✅ بيانات وهمية (مثال مؤقت للعرض فقط)
  final List<String> allItems = [
    'رياضيات 1',
    'رياضيات 2',
    'فيزياء عامة',
    'كيمياء تحليلية',
    'أحياء دقيقة',
    'حاسب آلي',
    'برمجة متقدمة',
    'شبكات الحاسب',
  ];

  @override
  Widget build(BuildContext context) {
    // ✅ فلترة العناصر حسب البحث
    final List<String> filteredItems = allItems
        .where((item) =>
        item.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OurAppbar(),

          // 🔍 صندوق البحث
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'بحث',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),

          // 📋 عرض النتائج بعد البحث
          Expanded(
            child: filteredItems.isEmpty
                ? const Center(
              child: Text(
                'لا توجد نتائج',
                style: TextStyle(fontSize: 16),
              ),
            )
                : ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.book),
                  title: Text(filteredItems[index]),
                  onTap: () {
                    // هتضيفي هنا التنقل أو التفاصيل
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

