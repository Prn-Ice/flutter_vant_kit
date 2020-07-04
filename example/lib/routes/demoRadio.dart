import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoRadio extends StatefulWidget {
  @override
  _DemoRadio createState() => _DemoRadio();
}

class _DemoRadio extends State<DemoRadio> {
  List<RadioItem> list = [
    RadioItem(name: "a", text: "Radio box 1"),
    RadioItem(name: "b", text: "Radio box 2"),
  ];

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title("Basic usage"),
        RadioGroup(
          value: 'a',
          list: list,
        ),
        title("Disabled"),
        RadioGroup(list: list, value: 'a', disabled: true),
        title("Custom colors"),
        RadioGroup(list: list, value: 'a', checkedColor: Colors.green),
        title("Custom shape"),
        RadioGroup(
          list: list,
          value: 'a',
          shape: 'square',
        ),
        title("Use with cell components"),
        RadioGroup(
          list: list,
          value: 'a',
          inCellGroup: true,
        ),
      ],
    ));
  }
}
