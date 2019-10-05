import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class Genre extends StatefulWidget {
  final Function callback;
  final bool isMale;

  Genre({@required this.callback, @required this.isMale});

  @override
  _GenreState createState() => _GenreState();
}

class _GenreState extends State<Genre> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      ListTile(title: Text('Selecione o seu genero')),
      Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                          iconSize: 48.0,
                          icon: Icon(FontAwesomeIcons.mars,
                              color: widget.isMale ? Colors.blue : Colors.grey),
                          onPressed: () => widget.callback(true)),
                      Text('Masculino')
                    ]),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                          iconSize: 48.0,
                          icon: Icon(FontAwesomeIcons.venus,
                              color: !widget.isMale
                                  ? Colors.pinkAccent
                                  : Colors.grey),
                          onPressed: () => widget.callback(false)),
                      Text('Feminino')
                    ])
              ]))
    ]));
  }
}
