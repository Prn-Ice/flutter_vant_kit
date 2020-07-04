import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoDivider extends StatefulWidget {
  @override
  _DemoDivider createState() => _DemoDivider();
}

class _DemoDivider extends State<DemoDivider> {
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
          NDivider(),
          title("Display text"),
          NDivider(
            content: "split line",
          ),
          title("Content location"),
          NDivider(
            content: "split line",
            contentPosition: 'left',
          ),
          SizedBox(height: 10),
          NDivider(
            content: "split line",
            contentPosition: 'right',
          ),
          title("Fine dividing line"),
          NDivider(
            content: "split line",
            hairline: true,
          ),
          title("Custom colors"),
          NDivider(
              lineColor: Colors.redAccent,
              fontColor: Colors.redAccent,
              content: "No more"),
          SizedBox(height: 10),
          NDivider(
              lineColor: Colors.orangeAccent,
              fontColor: Colors.orangeAccent,
              content: "No more"),
          SizedBox(height: 10),
          NDivider(
              lineColor: Colors.blueAccent,
              fontColor: Colors.blueAccent,
              content: "No more"),
          title("Custom content"),
          NDivider(child: Icon(Icons.cancel, color: Colors.blueAccent)),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
