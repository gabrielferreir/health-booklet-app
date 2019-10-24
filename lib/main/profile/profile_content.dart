import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_booklet/core/prefs/preferences.dart';
import 'package:health_booklet/core/utils/Age.dart';
import 'package:health_booklet/main/add_person/add_person_page.dart';
import 'package:health_booklet/main/login/login_page.dart';
import 'package:health_booklet/main/profile/profile.dart';
import 'package:health_booklet/models/person_model.dart';
import 'package:health_booklet/services/user.dart';

final colors = [
  Colors.deepPurple,
  Colors.blue.shade300,
  Colors.blueAccent,
  Colors.indigo,
  Colors.pinkAccent
];

class ProfileContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      print('user ${state.user}');
      if (state.loading)
        return Center(child: CircularProgressIndicator());
      else if (state.user != null)
        return Stack(
          children: <Widget>[
            SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                  Container(
                      width: double.infinity,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 48.0, bottom: 24),
                          child: CircleAvatar(
                            child: Text(state.user.firstName[0],
                                style: TextStyle(fontSize: 38)),
                            backgroundColor: Theme.of(context).primaryColor,
                            maxRadius: 65,
                          ))),
                  Text('${state.user.firstName} ${state.user.lastName}',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w300)),
                  Container(height: 24),
                  Container(
                    width: double.infinity,
                    child: Row(children: <Widget>[
                      Flexible(
                        child: Container(
                            height: 80,
                            decoration: BoxDecoration(
//                          color: Colors.red,
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: Colors.grey.shade200),
                                    top: BorderSide(
                                        width: 1,
                                        color: Colors.grey.shade200))),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                      state.user.isMale
                                          ? 'MASCULINO'
                                          : 'FEMININO',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87)),
                                  Text('SEXO',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black54))
                                ])),
                        flex: 1,
                        fit: FlexFit.tight,
                      ),
                      Flexible(
                        child: Container(
                            height: 80,
                            decoration: BoxDecoration(
//                          color: Colors.red,
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: Colors.grey.shade200),
                                    top: BorderSide(
                                        width: 1, color: Colors.grey.shade200),
                                    left: BorderSide(
                                        width: 1,
                                        color: Colors.grey.shade200))),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(Age.by(state.user.birthday).toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87)),
                                  Text('IDADE',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black54))
                                ])),
                        flex: 1,
                        fit: FlexFit.tight,
                      )
                    ]),
                  ),
                  Container(
                    width: double.infinity,
                    height: 300,
//                color: Colors.red,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(
                          top: 16.0, bottom: 16.0, right: 16.0),
                      child: Row(
                        children: [
                          _addDependents(context),
                          ...state.user.persons
                              .map<Widget>((item) => _dependents(item, context))
                              .toList()
                        ],
                      ),
                    ),
                  )
                ])),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 32),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
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
                    }),
              ),
            )
          ],
        );
      return Container();
    });
  }

  Widget _dependents(Person item, BuildContext context) {
    return Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        margin: const EdgeInsets.only(left: 16.0),
        child: Container(
            width: 200,
            height: 270,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(24)),
            child: Stack(children: <Widget>[
              Container(
                  width: double.infinity,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                            backgroundColor: Colors.white70,
                            maxRadius: 42,
                            child: Text(item.name[0],
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500)))
                      ])),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      width: double.infinity,
                      height: 80,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(item.name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500)),
                            Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: Text(
                                    '${Age.by(item.birthday)} ${Age.by(item.birthday) > 1 ? 'anos' : 'ano'}',
                                    style: TextStyle(
                                        color: Colors.white60, fontSize: 16)))
                          ])))
            ])));
  }

  Widget _addDependents(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AddPersonPage()));
      },
      child: Card(
          elevation: 2.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          margin: const EdgeInsets.only(left: 16.0),
          child: Container(
              width: 200,
              height: 270,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(24)),
              child: Container(
                  width: double.infinity,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.add, size: 80, color: Colors.white70)
                      ])))),
    );
  }
}
