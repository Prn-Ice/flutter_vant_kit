import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';
import 'package:intl/intl.dart';

import '../utils/index.dart';

class DemoCalendar extends StatefulWidget {
  @override
  _DemoCalendar createState() => _DemoCalendar();
}

class _DemoCalendar extends State<DemoCalendar> {
  DateTime _selectedDate1;
  List<DateTime> _selectedDate2;
  DateTime _selectedDate3;
  List<DateTime> _selectedDate4;
  List<DateTime> _selectedDate5;
  DateTime _selectedDate6;
  DateTime _selectedDate7;

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  String formatDateWithMonth(DateTime date) {
    return DateFormat('MM/dd').format(date);
  }

  String formatDateWithYear(DateTime date) {
    return DateFormat('yyyy/MM/dd').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          title("Basic usage"),
          CellGroup(
            children: <Widget>[
              Cell(
                title: "Select A Single Date",
                value: _selectedDate1 != null
                    ? formatDateWithYear(_selectedDate1)
                    : '',
                isLink: true,
                onClick: () => Calendar(
                  defaultDate: _selectedDate1,
                  maxDate: DateTime.now().add(Duration(days: 40)),
                  onConfirm: (dynamic date) {
                    setState(() {
                      _selectedDate1 = date as DateTime;
                    });
                  },
                ).show(context),
              ),
              Cell(
                title: "Select date range",
                value: _selectedDate2 != null
                    ? "${formatDateWithMonth(_selectedDate2[0])} - ${formatDateWithMonth(_selectedDate2[1])}"
                    : '',
                isLink: true,
                onClick: () => Calendar(
                  type: "range",
                  defaultDate: _selectedDate2,
                  onConfirm: (dynamic date) {
                    setState(() {
                      _selectedDate2 = date as List<DateTime>;
                    });
                  },
                ).show(context),
              ),
            ],
          ),
          title("Quick selection"),
          CellGroup(
            children: <Widget>[
              Cell(
                title: "Select a single date",
                value: _selectedDate3 != null
                    ? formatDateWithYear(_selectedDate3)
                    : '',
                isLink: true,
                onClick: () => Calendar(
                  showConfirm: false,
                  defaultDate: _selectedDate3,
                  onConfirm: (dynamic date) {
                    setState(() {
                      _selectedDate3 = date as DateTime;
                    });
                  },
                ).show(context),
              ),
              Cell(
                title: "Select date range",
                value: _selectedDate4 != null
                    ? "${formatDateWithMonth(_selectedDate4[0])} - ${formatDateWithMonth(_selectedDate4[1])}"
                    : '',
                isLink: true,
                onClick: () => Calendar(
                  type: "range",
                  showConfirm: false,
                  defaultDate: _selectedDate4,
                  onConfirm: (dynamic date) {
                    setState(() {
                      _selectedDate4 = date as List<DateTime>;
                    });
                  },
                ).show(context),
              ),
            ],
          ),
          title("Custom calendar"),
          CellGroup(
            children: <Widget>[
              Cell(
                title: "Custom colors",
                isLink: true,
                value: _selectedDate5 != null
                    ? "${DateFormat('MM/dd').format(_selectedDate5[0])} - ${DateFormat('MM/dd').format(_selectedDate5[1])}"
                    : '',
                onClick: () => Calendar(
                  color: Colors.green,
                  type: "range",
                  defaultDate: _selectedDate5,
                  onConfirm: (dynamic date) {
                    setState(() {
                      _selectedDate5 = date as List<DateTime>;
                    });
                  },
                ).show(context),
              ),
              Cell(
                title: "Custom date range",
                isLink: true,
                value: _selectedDate6 != null
                    ? formatDateWithYear(_selectedDate6)
                    : '',
                onClick: () => Calendar(
                  defaultDate: _selectedDate6,
                  minDate: DateFormat('yyyy-MM-dd').parse("2010-01-01"),
                  maxDate: DateFormat('yyyy-MM-dd').parse("2010-01-31"),
                  onConfirm: (dynamic date) {
                    setState(() {
                      _selectedDate6 = date as DateTime;
                    });
                  },
                ).show(context),
              ),
              Cell(
                title: "Custom button text",
                isLink: true,
                value: _selectedDate7 != null
                    ? formatDateWithYear(_selectedDate7)
                    : '',
                onClick: () => Calendar(
                  confirmText: "complete",
                  defaultDate: _selectedDate7,
                  onConfirm: (dynamic date) {
                    setState(() {
                      _selectedDate7 = date as DateTime;
                    });
                  },
                ).show(context),
              ),
            ],
          ),
          title("Tiled display"),
          Calendar(
            poppable: false,
            showConfirm: false,
            title: "Calendar",
            type: "range",
            defaultDate: [
              DateFormat('yyyy-MM-dd').parse("2012-11-10"),
              DateFormat('yyyy-MM-dd').parse("2012-11-12")
            ],
            minDate: DateFormat('yyyy-MM-dd').parse("2012-11-10"),
            maxDate: DateFormat('yyyy-MM-dd')
                .parse("2012-11-10")
                .add(Duration(days: 120)),
            onSelect: (dynamic date) {
              Utils.toast(date.toString());
            },
          ).show(context) as Widget,
        ]));
  }
}
