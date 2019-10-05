import 'package:flutter/material.dart';

class BookletPage extends StatefulWidget {
  @override
  _BookletPageState createState() => _BookletPageState();
}

class _BookletPageState extends State<BookletPage> {
  List list = [];

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("Cartilhas",
                        style: TextStyle(color: Colors.white, fontSize: 16.0))))
          ];
        },
        body: GridView.count(
            crossAxisCount: 3,
            children: List.generate(
                list.length,
                (index) => Center(
                        child: GestureDetector(
                            child: Column(children: <Widget>[
                      CircleAvatar(
                        radius: 32,
                        child: Text(list[index].name[0].toUpperCase()),
                      ),
                      Padding(padding: EdgeInsets.only(top: 8)),
                      Text(list[index].name)
                    ]))))));
  }
}
