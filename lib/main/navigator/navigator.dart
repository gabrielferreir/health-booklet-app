import 'package:flutter/material.dart';
import 'package:health_booklet/main/booklet/booklet_page.dart';
import 'package:health_booklet/main/home/home.dart';
import 'package:health_booklet/main/profile/profile_page.dart';

class NavigatorPage extends StatefulWidget {
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).primaryColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white60,
            currentIndex: _currentIndex,
            onTap: onTabTapped,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text('Home')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.library_books), title: Text('Cartilha')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text('Perfil'))
            ]),
        body: page(_currentIndex));
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget page(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return BookletPage();
      case 2:
        return ProfilePage();
      default:
        return Container();
    }
  }
}
