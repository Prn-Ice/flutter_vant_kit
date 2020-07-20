import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoBadge extends StatefulWidget {
  @override
  _DemoBadge createState() => _DemoBadge();
}

class _DemoBadge extends State<DemoBadge> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  Widget testButton() {
    return NButton(
      text: "push button",
      type: ButtonType.primary,
      onClick: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          title("Digit"),
          Row(children: <Widget>[
            Badge(
              value: "10",
              child: testButton(),
            ),
          ]),
          title("Red dot"),
          Row(children: <Widget>[
            Badge(child: testButton(), dot: true),
          ]),
          title("Version"),
          Row(children: <Widget>[
            Badge(
              child: testButton(),
              value: "NEW",
            ),
          ]),
          title("Custom style"),
          Row(
            children: <Widget>[
              Badge(
                value: "Customize",
                color: Colors.purpleAccent,
                child: testButton(),
              ),
              SizedBox(
                width: 25,
              ),
              Badge(
                value: "Customize",
                color: Colors.greenAccent,
                textColor: Colors.green,
                textSize: 16,
                child: testButton(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
