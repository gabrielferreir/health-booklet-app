import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_booklet/main/add_booklet/add_booklet_page.dart';
import 'package:health_booklet/main/vaccines_booklet/vaccines_booklet_page.dart';

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
      return Scaffold(
          body: state.loading
              ? Column(children: <Widget>[LinearProgressIndicator()])
              : Container(
                  child: ListView(padding: const EdgeInsets.all(0), children: [
                  state.list.length > 0
                      ? Column(
                          children: state.list
                              .map((item) => Dismissible(
                                  key: Key(item.id.toString()),
                                  direction: DismissDirection.startToEnd,
                                  onDismissed: (direction) {
                                    BlocProvider.of<BookletBloc>(context)
                                        .dispatch(Delete(id: item.id));
                                  },
                                  background: Container(
                                      color: Colors.red,
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Icon(Icons.delete,
                                              color: Colors.white))),
                                  child: ListTile(
                                    title: Text(item.booklet),
                                    subtitle: Text(item.person),
                                    trailing: Icon(Icons.arrow_forward),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  VaccinesBookletPage(
                                                      booklet: item)));
                                    },
                                  )))
                              .toList())
                      : Padding(
                          child: Text('Nenhuma caderneta foi encontrada'),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                        ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    child: InkWell(
                      onTap: () async {
                        final add = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddBookletPage()));
                        if (add) {
                          BlocProvider.of<BookletBloc>(context)
                              .dispatch(Started());
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content:
                                  Text('Cartilha adicionada com sucesso!')));
                        }
                      },
                      child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(.96)),
                          child: Text('ADICIONAR CARTILHA',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 16))),
                    ),
                  ),
                ])));
    });
  }
}
