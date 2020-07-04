import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

import '../utils/index.dart';

class DemoCheckbox extends StatefulWidget {
  @override
  _DemoCheckbox createState() => _DemoCheckbox();
}

class _DemoCheckbox extends State<DemoCheckbox> {
  List<CheckItem> list = [
    CheckItem(name: "a", text: "Check box a"),
    CheckItem(name: "b", text: "Check box b"),
  ];

  List<CheckItem> list2 = [
    CheckItem(name: "a", text: "Check box a"),
    CheckItem(name: "b", text: "Check box b"),
    CheckItem(name: "c", text: "Checkbox c", checkedColor: Colors.green),
    CheckItem(name: "d", text: "Check box d", disabled: true),
  ];

  List<CheckItem> list3 = [
    CheckItem(name: "a", text: "Check box a"),
    CheckItem(name: "b", text: "Check box b"),
    CheckItem(name: "c", text: "Checkbox c"),
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
        CheckboxGroup(
          list: list,
          values: ["a"],
          onChange: (list) {
            Utils.toast(list.toString());
          },
        ),
        title("Disabled"),
        CheckboxGroup(
          list: list,
          values: ["a"],
          disabled: true,
        ),
        title("Custom shape"),
        CheckboxGroup(
          list: list,
          values: ["a"],
          shape: "square",
        ),
        title("Custom colors"),
        CheckboxGroup(
          list: list,
          values: ["a"],
          checkedColor: Colors.green,
        ),
        title("Check box group"),
        CheckboxGroup(
          list: list2,
          values: ["a", "b"],
        ),
        title("Set the maximum selectable number"),
        CheckboxGroup(
          list: list3,
          values: ["a"],
          max: 2,
        ),
        title("Cell component"),
        CheckboxGroup(
          list: list3,
          values: ['a'],
          inCellGroup: true,
        ),
        SizedBox(
          height: 20,
        )
      ],
    ));
  }
}
