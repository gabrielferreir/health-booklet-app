import 'package:health_booklet/core/prefs/preferences.dart';
import 'package:health_booklet/main/login/login.dart';
import 'package:health_booklet/services/user.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final UserService userService;

  MyDrawer({@required this.userService});

  logout(context) async {
    await userService.logout(prefs: Preferences());
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: <Widget>[
      UserAccountsDrawerHeader(
          accountName: Text(userService?.user?.email ?? ''),
          accountEmail: Text('Health Booklet'),
          currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(userService?.user?.email != null
                  ? userService?.user?.email[0].toUpperCase()
                  : ''))),
      Expanded(
          child: ListView(padding: EdgeInsets.all(0), children: <Widget>[])),
      Container(
          child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                  child: Column(children: <Widget>[
                Divider(),
                ListTile(
                    title: Text('Sair'),
                    trailing: Text('1.0.0'),
                    onTap: () {
                      logout(context);
                    })
              ]))))
    ]));
  }
}
