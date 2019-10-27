import 'package:flutter/material.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List list = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Health Boolet',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            MyCard(),
            MyCard(),
            MyCard(),
            MyCard(),
            MyCard(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: IntrinsicHeight(
        child: Row(
          children: <Widget>[
            Container(
              width: 110,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image.network(
                    'https://f.i.uol.com.br/fotografia/2018/09/13/15368809905b9af15e26c78_1536880990_3x2_md.jpg'),
              ),
            ),
            Expanded(
              child: Container(
//                color: Colors.indigo,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Campanha de vacinação B',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                      Text(
                        'Campanha de vacinação B Campanha de vacinação B Campanha de vacinação B Campanha de vacinação B .',
                        maxLines: 4,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
