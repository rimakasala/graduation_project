import 'package:go_router/go_router.dart';
import 'package:graduation_project/Features/Borrow_Screens/Screens/Borrowing_Info.dart';
import 'package:graduation_project/Features/Borrow_Screens/Screens/search.dart';
import 'package:graduation_project/Features/Entered_Screens/Screens/CustomScannerScreen.dart';
import 'package:graduation_project/Features/Entered_Screens/Screens/EnteredScreen.dart';
import 'package:graduation_project/Features/Entered_Screens/Screens/Home.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => Home(),
    ),
    // GoRoute(
    //   path: '/about',
    //   builder: (context, state) => AboutPage(),
    // ),
    GoRoute(
        path: '/CustomScannerScreen',
        builder: (context , state )=>CustomScannerScreen()
    ),
    GoRoute(
        path: '/search',
        builder: (context , state )=>Search()
    ),
    GoRoute(
        path: '/EnteredScreen',
        builder: (context ,state )=>EnteredScreen()
    ),

  ],
);
