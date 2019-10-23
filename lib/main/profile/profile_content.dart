import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_booklet/core/prefs/preferences.dart';
import 'package:health_booklet/main/login/login_page.dart';
import 'package:health_booklet/main/profile/profile.dart';
import 'package:health_booklet/services/user.dart';

class ProfileContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        print('user ${state.user}');
        if (state.loading)
          return Center(child: CircularProgressIndicator());
        else if (state.user != null)
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: double.infinity,
                    child: Padding(
                        padding: const EdgeInsets.all(48.0),
                        child: CircleAvatar(
                          child: Text(state.user.firstName[0],
                              style: TextStyle(fontSize: 38)),
                          backgroundColor: Theme.of(context).primaryColor,
                          maxRadius: 100,
                        ))),
                Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.grey,
                ),
                IconButton(
                  icon: Icon(
                    Icons.exit_to_app,
                    size: 48,
                  ),
                  onPressed: () {
                    UserService().logout(prefs: Preferences());
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        ModalRoute.withName('/root'));
                  },
                )
              ],
            ),
          );
        return Container();
      },
    );
  }
}
