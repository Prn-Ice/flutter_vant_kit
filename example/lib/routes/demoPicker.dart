import 'package:example/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoPicker extends StatefulWidget {
  @override
  _DemoPicker createState() => _DemoPicker();
}

class _DemoPicker extends State<DemoPicker> {
  dynamic options = [
    PickerItem("Hangzhou"),
    PickerItem("Ningbo"),
    PickerItem("Wenzhou"),
    PickerItem("Jiaxing"),
    PickerItem("Huzhou"),
  ];

  dynamic options1 = [
    PickerItem("Zhejiang", child: [
      PickerItem("Hangzhou"),
      PickerItem("Ningbo"),
      PickerItem("Wenzhou"),
      PickerItem("Jiaxing"),
      PickerItem("Huzhou"),
    ]),
    PickerItem("Fujian Province", child: [
      PickerItem("Fuzhou"),
      PickerItem("Xiamen"),
      PickerItem("Putian"),
      PickerItem("Sanming"),
      // PickerItem("泉州"),
    ]),
  ];

  String _city;
  int _cityId;

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
          Picker(colums: options),
          title("Selected by default"),
          Picker(colums: options, defaultIndex: 2),
          title("Show top bar"),
          Picker(
              colums: options,
              showToolbar: true,
              title: "Title",
              onCancel: (values, index) {
                Utils.toast("cancel");
              },
              onConfirm: (values, index) {
                Utils.toast("confirm the options are $values, $index");
              }),
          title("Use with pop-up layer"),
          Cell(
            title: "City",
            isLink: true,
            value: _city,
            onClick: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Picker(
                      colums: options,
                      defaultIndex: _cityId,
                      showToolbar: true,
                      onConfirm: (values, index) {
                        setState(() {
                          _city = values.join('');
                          _cityId = index;
                        });
                        Navigator.of(context).pop();
                      },
                      onCancel: (values, index) {
                        Navigator.of(context).pop();
                      },
                    );
                  });
            },
          ),
          title("Multi-column linkage"),
          Picker(
              colums: options1,
              level: 2,
              defaultIndex: [0, 2],
              showToolbar: true,
              title: "Title",
              onCancel: (values, index) {
                Utils.toast("cancel");
              },
              onConfirm: (values, index) {
                Utils.toast("Confirm, the options are $values, $index");
              }),
          title("Loading state"),
          Picker(colums: options1, level: 2, showToolbar: true, loading: true),
        ],
      ),
    );
  }
}
