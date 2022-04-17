import 'package:flutter/material.dart';


import 'homepage.dart';

class Menu extends StatefulWidget {
  static String tag = 'Menu';

  @override
  State<Menu> createState() => _Menu();
}

class _Menu extends State<Menu> {
  int currentIndex = 0;
  
  final Screens = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        onTap: (index) => setState(
          () => currentIndex = index,
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
