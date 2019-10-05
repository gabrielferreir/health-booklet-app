import 'package:flutter/material.dart';
import 'package:health_booklet/core/utils/DataUtils.dart';

class DateField extends StatefulWidget {
  final Function callback;
  final DateTime selectedDate;

  DateField({@required this.callback, @required this.selectedDate});

  @override
  _DateFieldState createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
//  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: widget.selectedDate,
        firstDate: DateTime(1940),
        lastDate: DateTime.now());
    if (picked != null && picked != widget.selectedDate)
      widget.callback(picked);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text('Selecione sua data de aniversario'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                DateUtils.toBRTime(widget.selectedDate),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              IconButton(
                onPressed: () => _selectDate(context),
                icon: Icon(Icons.today, color: Theme.of(context).primaryColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
