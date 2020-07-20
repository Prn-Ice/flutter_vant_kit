import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

import '../utils/index.dart';

class DemoActionSheet extends StatefulWidget {
  @override
  _DemoActionSheet createState() => _DemoActionSheet();
}

class _DemoActionSheet extends State<DemoActionSheet> {
  List<ActionSheetItem> actionList = [
    ActionSheetItem(name: "Options"),
    ActionSheetItem(name: "Options"),
    ActionSheetItem(name: "Options", subname: "Basic Information"),
  ];

  List<ActionSheetItem> actionList2 = [
    ActionSheetItem(name: "Options", color: Colors.green),
    ActionSheetItem(loading: true),
    ActionSheetItem(name: "Options", disabled: true),
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
          NButton(
            text: "Popup menu",
            type: ButtonType.primary,
            onClick: () {
              ActionSheet(
                  actions: actionList,
                  onSelect: (action, index, context) {
                    Utils.toast(action.name);
                  }).show(context);
            },
          ),
          title("Option status"),
          NButton(
            text: "Popup menu",
            type: ButtonType.primary,
            onClick: () {
              ActionSheet(actions: actionList2).show(context);
            },
          ),
          title("Show cancel button"),
          NButton(
            text: "Popup menu",
            type: ButtonType.primary,
            onClick: () {
              ActionSheet(
                actions: actionList,
                cancelText: "cancel",
                onCancel: () {
                  Utils.toast("cancel");
                },
              ).show(context);
            },
          ),
          title("Display descriptive information"),
          NButton(
            text: "Popup menu",
            type: ButtonType.primary,
            onClick: () {
              ActionSheet(
                actions: actionList,
                title: "title",
                description: "This is a descriptive message",
              ).show(context);
            },
          ),
          title("Show title bar"),
          NButton(
            text: "Popup menu",
            type: ButtonType.primary,
            onClick: () {
              ActionSheet(
                child: Container(
                  height: 150,
                  padding: EdgeInsets.all(10),
                  alignment: AlignmentDirectional.topStart,
                  child: Text("data"),
                ),
                title: "title",
                closeIcon: Icons.highlight_off,
              ).show(context);
            },
          ),
        ],
      ),
    );
  }
}
