import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

import '../utils/index.dart';

class DemoStepper extends StatefulWidget {
  @override
  _DemoStepper createState() => _DemoStepper();
}

class _DemoStepper extends State<DemoStepper> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 30, 0, 10),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CellGroup(
            children: <Widget>[
              Cell(
                title: "Basic usage",
                customRight: Steppers(
                  onChange: (val) {
                    Utils.toast(val);
                  },
                ),
              ),
              Cell(
                title: "Step setting",
                customRight: Steppers(
                  step: 2,
                  onChange: (val) {
                    Utils.toast(val);
                  },
                ),
              ),
              Cell(
                title: "Limit input range",
                customRight: Steppers(
                  value: 5,
                  min: 5,
                  max: 10,
                  onChange: (val) {
                    Utils.toast(val);
                  },
                ),
              ),
              Cell(
                title: "Disabled",
                customRight: Steppers(value: 1, disabled: true),
              ),
              Cell(
                title: "Disable input box state",
                customRight: Steppers(
                  value: 1,
                  disabledInput: true,
                  onChange: (val) {},
                ),
              ),
              Cell(
                title: "Decimal point",
                customRight: Steppers(
                  value: 1,
                  step: 0.2,
                  decimalLength: 2,
                  inputWidth: 46,
                  onChange: (val) {},
                ),
              ),
              Cell(
                title: "Custom size",
                customRight: Steppers(
                  value: 1,
                  size: 28,
                  inputWidth: 100,
                  onChange: (val) {},
                ),
              )
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
