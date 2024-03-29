import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_booklet/models/booklet_model.dart';
import 'package:health_booklet/models/person_model.dart';

import 'add_booklet.dart';

class AddBookletContent extends StatefulWidget {
  @override
  _AddBookletContentState createState() => _AddBookletContentState();
}

class _AddBookletContentState extends State<AddBookletContent> {
  PageController _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddBookletBloc, AddBookletState>(
        builder: (context, state) {
      return BlocListener<AddBookletBloc, AddBookletState>(
        listener: (context, state) {
          _pageController.animateToPage(state.page,
              duration: Duration(milliseconds: 180), curve: Curves.ease);

          if (state.created) {
            Navigator.pop(context, true);
          }
        },
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                    expandedHeight: 160.0,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Text('Adicionar Cartilha',
                            style: TextStyle(
                                color: Colors.white, fontSize: 16.0))))
              ];
            },
            body: Material(
                child: Stack(children: <Widget>[
              PageView(
                  controller: _pageController,
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    state.listPersonBooklet.length > 0
                        ? Column(
                            children: state.listPersonBooklet
                                .map((item) => PersonItemList(
                                    person: item,
                                    idSelected: state.selectedPerson,
                                    onChanged: (int id) {
                                      BlocProvider.of<AddBookletBloc>(context)
                                          .dispatch(SelectedPerson(id));
                                    }))
                                .toList(),
                          )
                        : ListTile(
                            dense: true,
                            title: Text('Nenhum registro foi encontrado'),
                          ),
                    Column(
                        children: state.listBooklet
                            .map((item) => BookletItemList(
                                booklet: item,
                                idSelected: state.selectedBooklet,
                                onChanged: (int id) {
                                  BlocProvider.of<AddBookletBloc>(context)
                                      .dispatch(SelectedBooklet(id));
                                }))
                            .toList()),
                    Center(child: Text('ABC'))
                  ]),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      width: double.infinity,
                      height: 56.0,
                      color: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            state.page == 1
                                ? GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<AddBookletBloc>(context)
                                          .dispatch(GoToPerson());
                                    },
                                    child: Text('VOLTAR',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                  )
                                : Text(''),
                            Text(''),
                            state.page == 1
                                ? GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<AddBookletBloc>(context)
                                          .dispatch(Register(
                                              idPerson: state.selectedPerson,
                                              idBooklet:
                                                  state.selectedBooklet));
                                    },
                                    child: Text('SALVAR',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<AddBookletBloc>(context)
                                          .dispatch(GoToBooklet());
                                    },
                                    child: Text('AVANÇAR',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                  )
                          ])))
            ]))),
      );
    });
  }
}

class PersonItemList extends StatelessWidget {
  final Person person;
  final int idSelected;
  final Function onChanged;

  PersonItemList(
      {@required this.person,
      @required this.idSelected,
      @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(person.name ?? 'Sem nome'),
        leading: Radio(
            value: person.id, groupValue: idSelected, onChanged: onChanged));
  }
}

class BookletItemList extends StatelessWidget {
  final Booklet booklet;
  final int idSelected;
  final Function onChanged;

  BookletItemList(
      {@required this.booklet,
      @required this.idSelected,
      @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(booklet.name ?? 'Sem nome'),
        leading: Radio(
            value: booklet.id, groupValue: idSelected, onChanged: onChanged));
  }
}
