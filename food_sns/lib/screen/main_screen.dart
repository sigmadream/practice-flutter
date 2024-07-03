import 'package:flutter/material.dart';
import 'package:food_sns/screen/favorite_screen.dart';
import 'package:food_sns/screen/home_screen.dart';
import 'package:food_sns/screen/my_info_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final _screenType = [
    HomeScreen(),
    FavoriteScreen(),
    MyInfoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screenType.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.black,
          selectedItemColor: const Color(0xff14FF00),
          unselectedItemColor: Colors.white,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],
        ));
  }
}
