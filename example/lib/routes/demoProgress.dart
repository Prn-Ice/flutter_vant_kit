import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoProgress extends StatefulWidget {
  @override
  _DemoProgress createState() => _DemoProgress();
}

class _DemoProgress extends State<DemoProgress> {
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
          Progress(percentage: 50, showPivot: true),
          title("Line thickness"),
          Progress(percentage: 50, strokeWidth: 8, showPivot: true),
          title("Put gray"),
          Progress(percentage: 50, inactive: true, showPivot: true),
          title("Style customization"),
          Column(
            children: <Widget>[
              Progress(
                  percentage: 30,
                  color: Colors.orangeAccent,
                  pivotColor: Colors.orangeAccent,
                  pivotText: "Orange",
                  showPivot: true),
              Progress(
                  percentage: 50,
                  color: Colors.redAccent,
                  pivotColor: Colors.redAccent,
                  pivotText: "Revolutionary",
                  showPivot: true),
              Progress(
                  percentage: 70,
                  color: Colors.purple,
                  pivotColor: Colors.purple,
                  pivotText: "Purple",
                  showPivot: true)
            ],
          ),
        ],
      ),
    );
  }
}
