import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoNumberKeyboard extends StatefulWidget {
  @override
  _DemoNumberKeyboard createState() => _DemoNumberKeyboard();
}

class _DemoNumberKeyboard extends State<DemoNumberKeyboard> {
  TextEditingController testInput = TextEditingController();

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
          text: "The default keyboard pops up",
          type: "primary",
          onClick: () {
            NumberKeyboard(
              title: "Default keyboard",
              closeButtomText: "Complete",
              extraKey: ".",
            ).show(context);
          },
        ),
        title("Two-way binding"),
        Field(
          placeholder: "Click here",
          controller: testInput,
          readonly: true,
          onClick: () {
            NumberKeyboard(
                value: testInput.text,
                maxlength: 6,
                closeButtomText: "complete",
                extraKey: ".",
                onChange: (String val) {
                  setState(() {
                    testInput.text = val;
                  });
                }).show(context);
          },
        ),
      ],
    ));
  }
}
