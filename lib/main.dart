import 'package:health_booklet/core/prefs/preferences.dart';
import 'package:health_booklet/main/auth/auth_page.dart';
import 'package:health_booklet/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Health Booklet',
        theme: theme,
        home: AuthPage(prefs: Preferences()));
  }
}
