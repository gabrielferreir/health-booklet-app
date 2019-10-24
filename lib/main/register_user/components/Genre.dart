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
      child: Stack(
        children: <Widget>[
          Container(
              margin: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 1)),
              child: Column(children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, top: 32, right: 16.0, bottom: 16.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                    iconSize: 48.0,
                                    icon: Icon(FontAwesomeIcons.mars,
                                        color: widget.isMale
                                            ? Theme.of(context).primaryColor
                                            : Colors.grey),
                                    onPressed: () => widget.callback(true)),
                                Text('Masculino',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: widget.isMale
                                            ? Theme.of(context).primaryColor
                                            : Colors.grey))
                              ]),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                    iconSize: 48.0,
                                    icon: Icon(FontAwesomeIcons.venus,
                                        color: !widget.isMale
                                            ? Colors.pink
                                            : Colors.grey),
                                    onPressed: () => widget.callback(false)),
                                Text('Feminino',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: !widget.isMale
                                            ? Colors.pink
                                            : Colors.grey))
                              ])
                        ]))
              ])),
          Positioned(
            top: 0,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Text('Selecione o seu genero',
                  style: TextStyle(
                      fontSize: 12, color: Theme.of(context).primaryColor)),
            ),
          )
        ],
      ),
    );
  }
}
