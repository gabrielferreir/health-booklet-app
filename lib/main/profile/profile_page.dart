import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        body: BlocProvider(
            builder: (context) => ProfileBloc()..dispatch(Started()),
            child: ProfileContent()));
  }
}
