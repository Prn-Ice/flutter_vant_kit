import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

import '../utils/index.dart';

class DemoSubmitBar extends StatefulWidget {
  @override
  _DemoSubmitBar createState() => _DemoSubmitBar();
}

class _DemoSubmitBar extends State<DemoSubmitBar> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
          SubmitBar(buttonText: "Submit orders", price: 30.50),
          title("Disabled"),
          SubmitBar(
            buttonText: "Submit orders",
            price: 30.50,
            tip: "delivery address does not support delivery",
            tipIcon: Icons.error_outline,
            disabled: true,
          ),
          title("Loading state"),
          SubmitBar(
            buttonText: "Submit orders",
            price: 30.50,
            loading: true,
          ),
          title("Advanced usage"),
          SubmitBar(
            buttonText: "Submit orders",
            price: 30.50,
            tip: "delivery address does not support delivery",
            customTip: GestureDetector(
              onTap: () {
                Utils.toast("Clicked Tip");
              },
              child: Text("Change address",
                  style: TextStyle(fontSize: 12, color: Colors.blueAccent)),
            ),
            customLeft: NCheckbox(text: "select all", value: true),
          ),
        ]));
  }
}
