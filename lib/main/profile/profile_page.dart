import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_booklet/core/prefs/preferences.dart';
import 'package:health_booklet/main/login/login_page.dart';
import 'package:health_booklet/main/profile/profile.dart';
import 'package:health_booklet/main/profile/profile_content.dart';
import 'package:health_booklet/services/user.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    print(UserService().user);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Meu Perfil',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.exit_to_app,
                  size: 32,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  UserService().logout(prefs: Preferences());
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      ModalRoute.withName('/root'));
                })
          ],
        ),
        body: BlocProvider(
            builder: (context) => ProfileBloc()..dispatch(Started()),
            child: ProfileContent()));
  }
}
