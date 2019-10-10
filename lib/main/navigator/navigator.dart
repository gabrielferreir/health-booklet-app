import 'package:bottom_navy_bar/bottom_navy_bar.dart';
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
        bottomNavigationBar: BottomNavyBar(
            selectedIndex: _currentIndex,
            showElevation: false,
            onItemSelected: onTabTapped,
            items: [
              BottomNavyBarItem(
                icon: Icon(Icons.apps),
                title: Text('Home'),
                activeColor: Theme.of(context).primaryColor,
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.library_books),
                  title: Text('Vacinas'),
                  activeColor: Theme.of(context).primaryColor),
              BottomNavyBarItem(
                  icon: Icon(Icons.settings),
                  title: Text('Perfil'),
                  activeColor: Theme.of(context).primaryColor)
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
