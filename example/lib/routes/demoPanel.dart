import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoPanel extends StatefulWidget {
  @override
  _DemoPanel createState() => _DemoPanel();
}

class _DemoPanel extends State<DemoPanel> {
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
            Panel(
                title: "Title",
                desc: "Description",
                status: "status",
                body: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[Text("Content")],
                )),
            title("Advanced usage"),
            Panel(
              title: "Title",
              desc: "Description",
              status: "status",
              body: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[Text("Content")],
              ),
              footer: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  NButton(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    type: ButtonType.danger,
                    size: ButtonSize.small,
                    text: "Certain",
                    onClick: () => {},
                  ),
                  SizedBox(width: 8),
                  NButton(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    size: ButtonSize.small,
                    text: "Cancel",
                    onClick: () => {},
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
