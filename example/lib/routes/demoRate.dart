import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

import '../utils/index.dart';

class DemoRate extends StatefulWidget {
  @override
  _DemoRate createState() => _DemoRate();
}

class _DemoRate extends State<DemoRate> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              title("Basic usage"),
              Rate(
                value: 3,
              ),
              title("Custom icon"),
              Rate(
                value: 3,
                icon: Icons.favorite,
                voidIcon: Icons.favorite_border,
                onChange: (val) {
                  Utils.toast("Rate changed: $val");
                },
              ),
              title("Custom style"),
              Rate(
                value: 3,
                color: Colors.blueAccent,
                voidColor: Colors.blueAccent,
                size: 36.0,
                gutter: 8.0,
                onChange: (val) {
                  Utils.toast("Rate changed: $val");
                },
              ),
              title("Custom quantity"),
              Rate(
                count: 7,
                value: 4,
              ),
              title("Disabled"),
              Rate(value: 3, disabled: true),
              title("Read-only status"),
              Rate(value: 3, readonly: true)
            ]));
  }
}
