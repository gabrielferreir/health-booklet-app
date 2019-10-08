import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_booklet/main/add_booklet/add_booklet_page.dart';

import 'booklet.dart';

class BookletContent extends StatefulWidget {
  @override
  _BookletContentState createState() => _BookletContentState();
}

class _BookletContentState extends State<BookletContent> {
  List list = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookletBloc, BookletState>(builder: (context, state) {
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
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.0))))
            ];
          },
          body: state.loading
              ? Column(children: <Widget>[LinearProgressIndicator()])
              : Container(
                  child: ListView(padding: const EdgeInsets.all(0), children: [
                  Column(
                      children: state.list
                          .map((item) => ListTile(
                                title: Text(item.booklet),
                                subtitle: Text(item.person),
                                trailing: Icon(Icons.arrow_forward),
                                onTap: () {
                                  print('TAP');
                                },
                              ))
                          .toList()),
                  ListTile(
                    title: Text('ADICIONAR CARTILHA',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    onTap: () async {
                      final add = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddBookletPage()));
                      if (add) {
                        BlocProvider.of<BookletBloc>(context)
                            .dispatch(Started());
                        Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Cartilha adicionada com sucesso!')));
                      }
                    },
                  )
                ])));
    });
  }
}
