import 'dart:async';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:health_booklet/main/booklet/booklet_page.dart';
import 'package:health_booklet/main/home/home.dart';
import 'package:health_booklet/main/profile/profile_page.dart';

class NavigatorPage extends StatefulWidget {
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> with SingleTickerProviderStateMixin  {
  final pageController = PageController(initialPage: 0);

  final StreamController ctrl = StreamController<int>();

  @override
  void initState() {
    ctrl.sink.add(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('***************BUILD');
    return Scaffold(
        bottomNavigationBar: StreamBuilder(
          stream: ctrl.stream,
          builder: (context, snap) {
            print(snap.data);
            return BottomNavyBar(
                selectedIndex: snap.data,
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
                ]);
          },
        ),
        body: PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[HomePage(), BookletPage(), ProfilePage()],
        ));
  }

  void onTabTapped(int index) {
//    setState(() {
//      _currentIndex = index;
//    });
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 180), curve: Curves.ease);

    ctrl.sink.add(index);
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
