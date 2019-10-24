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
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Theme.of(context).primaryColor)),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 12, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        DateUtils.toBRTime(widget.selectedDate),
                        style: TextStyle(
                            color:
                                Theme.of(context).primaryColor.withOpacity(.8),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      IconButton(
                        onPressed: () => _selectDate(context),
                        icon: Icon(Icons.today,
                            color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 8,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              color: Colors.white,
              child: Text(
                'Selecione sua data de aniversario',
                style: TextStyle(
                    fontSize: 12, color: Theme.of(context).primaryColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
