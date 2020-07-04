import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

import '../utils/index.dart';

class DemoPasswordInput extends StatefulWidget {
  @override
  _DemoPasswordInput createState() => _DemoPasswordInput();
}

class _DemoPasswordInput extends State<DemoPasswordInput> {
  String _value = "123";

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
        PasswordInput(
          value: _value,
          info: "Password is 6 Digits",
          onSubmitted: (val) {
            Utils.toast("onSubmitted $val");
          },
        ),
        title("Custom length"),
        PasswordInput(
            value: "1234",
            info: "Please enter SMS verification code",
            length: 4),
        title("Plaintext display"),
        PasswordInput(
          value: "12",
          mask: false,
        )
      ],
    ));
  }
}
