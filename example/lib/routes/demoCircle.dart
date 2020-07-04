import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoCircle extends StatefulWidget {
  @override
  _DemoCircle createState() => _DemoCircle();
}

class _DemoCircle extends State<DemoCircle> {
  double percentage = 70;

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
          Progress(
              percentage: 30,
              type: "circular",
              showPivot: true,
              circularSize: 120),
          title("Style customization"),
          Row(
            children: <Widget>[
              NButton(
                text: "Increase",
                type: "primary",
                onClick: () {
                  setState(() {
                    percentage += 10;
                  });
                },
              ),
              SizedBox(width: 6),
              NButton(
                text: "Decrease",
                type: "danger",
                onClick: () {
                  setState(() {
                    percentage -= 10;
                  });
                },
              )
            ],
          ),
          Progress(
              percentage: percentage,
              type: "circular",
              showPivot: true,
              strokeWidth: 10,
              pivotText: "Customized width"),
          Progress(
              percentage: percentage,
              type: "circular",
              showPivot: true,
              color: Colors.redAccent,
              pivotText: "Color customization"),
          Progress(
              percentage: percentage,
              type: "circular",
              showPivot: true,
              circularSize: 150,
              color: Colors.purple,
              pivotText: "Size customization"),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
