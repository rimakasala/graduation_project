import 'package:flutter/material.dart';
class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int index=0;

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      onTap: (int x){
        setState(() {
          index=x;
        });
      },
      currentIndex: index,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,
      items: const [


    ],

    );
  }
}
