import 'package:go_router/go_router.dart';
import 'package:graduation_project/Features/Borrow_Screens/Screens/NotificationPage%20.dart';
import 'package:graduation_project/Features/Borrow_Screens/Screens/search.dart';
import 'package:graduation_project/Features/Chat/Screen/Chat_Page.dart';
import 'package:graduation_project/Features/Entered_Screens/Screens/CustomScannerScreen.dart';
import 'package:graduation_project/Features/Entered_Screens/Screens/EnteredScreen.dart';
import 'package:graduation_project/Features/Entered_Screens/Screens/Home.dart';
import 'package:graduation_project/Features/Exam/Screens/Academic_year.dart';
import 'package:graduation_project/Features/Exam/Screens/Department.dart';
import 'package:graduation_project/Features/Exam/Screens/Semester.dart';
import 'package:graduation_project/Features/Exam/Screens/Study_program.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
        path: '/CustomScannerScreen',
        builder: (context , state )=>const CustomScannerScreen()
    ),
    GoRoute(
        path: '/search',
        builder: (context , state )=>const Search()
    ),
    GoRoute(
        path: '/EnteredScreen',
        builder: (context ,state )=>const EnteredScreen()
    ),
    GoRoute(
        path: '/StudyProgram',
        builder: (context,state )=>const StudyProgram()
    ),
    GoRoute(
        path: '/AcademicYear',
      builder: (context, state) {
        final programId = state.extra as int; 
        print('GOROUTER =${state.extra}');
        return AcademicYear(programId: programId);//// ابعتيه للصفحة
      },
    ),
    GoRoute(
        path:  '/2',
      builder: (context ,state)=> const Semester(),
    ),
    GoRoute(
      path: '/NotificationPage',
      builder: (context,state) =>const NotificationPage(),
    ),
    GoRoute(
        path: '/Department',
        builder: (context, state)=> const Department(),
    ),
    GoRoute(
        path: '/Chat',
        builder: (context , state )=>ChatPage()
    )
]
);
