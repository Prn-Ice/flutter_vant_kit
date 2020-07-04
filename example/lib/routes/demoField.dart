import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

import '../utils/index.dart';

class DemoField extends StatefulWidget {
  @override
  _DemoField createState() => _DemoField();
}

class _DemoField extends State<DemoField> {
  var testInput1 = TextEditingController();
  var testInput2 = TextEditingController(text: "test");
  var testInput3 = TextEditingController();
  var testInput4 = TextEditingController();
  var testInput5 = TextEditingController();
  var testInput6 = TextEditingController();
  var testInput7 = TextEditingController();
  var testInput8 = TextEditingController();

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  bool isEmptyName(String text) {
    return !(text != null && text != "");
  }

  bool isErrorPhone(String text) {
    String patttern = r'(^([1][3,4,5,6,7,8,9])\d{9}$)';
    return !(new RegExp(patttern).hasMatch(text));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          title("Basic usage"),
          CellGroup(
            children: <Widget>[
              Field(
                placeholder: "please enter user name",
                controller: testInput1,
                onChange: (val) {
                  Utils.toast("text changed: $val");
                },
                onSubmitted: (val) {
                  Utils.toast("submitted: $val");
                },
              )
            ],
          ),
          title("Custom type"),
          CellGroup(children: <Widget>[
            Field(
              label: "user name",
              placeholder: "please enter user name",
              controller: testInput2,
              maxLength: 10,
              clearable: true,
              rightIcon: Icons.help_outline,
              require: true,
              clickRight: () async {
                Utils.toast("Click Right!");
              },
            ),
            Field(
                label: "secret code",
                placeholder: "Please enter the password",
                controller: testInput3,
                require: true,
                type: "password"),
          ]),
          title("Disable input box"),
          CellGroup(
            children: <Widget>[
              Field(
                label: "user",
                placeholder: "Input box is disabled",
                disabled: true,
                controller: testInput4,
                leftIcon: Icons.perm_identity,
                clickLeft: () async {
                  Utils.toast("click left");
                },
              )
            ],
          ),
          title("Error message"),
          CellGroup(
            children: <Widget>[
              Field(
                label: "user",
                placeholder: "please enter user name",
                error: isEmptyName(testInput5.text),
                controller: testInput5,
                maxLength: 10,
                clearable: true,
                onChange: (val) {
                  setState(() {
                    testInput5.text = val;
                  });
                },
              ),
              Field(
                label: "phone",
                placeholder: "Please enter phone number",
                controller: testInput6,
                errorMessage: isErrorPhone(testInput6.text)
                    ? "Malformed phone number"
                    : null,
                maxLength: 11,
                clearable: true,
                onChange: (val) {
                  setState(() {
                    testInput6.text = val;
                  });
                },
              ),
            ],
          ),
          title("Insert button"),
          CellGroup(
            children: <Widget>[
              Field(
                label: "SMS",
                placeholder: "Please enter SMS verification code",
                controller: testInput7,
                right: NButton(
                  text: "Send the verification code",
                  type: "primary",
                  size: "small",
                  onClick: () {},
                ),
              ),
            ],
          ),
          title("Show word count"),
          CellGroup(
            children: <Widget>[
              Field(
                  label: "leave",
                  placeholder: "Please enter a message",
                  controller: testInput8,
                  type: "textarea",
                  rows: 5,
                  maxLength: 100,
                  showWordLimit: true),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
