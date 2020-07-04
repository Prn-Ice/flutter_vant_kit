import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoPrice extends StatefulWidget {
  @override
  _DemoPrice createState() => _DemoPrice();
}

class _DemoPrice extends State<DemoPrice> {
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
          Price(
            value: 1234.567,
          ),
          title("Keep three decimal places"),
          Price(
            value: 1234.567,
            decimal: 3,
          ),
          title("Custom symbols and colors"),
          Price(
            currency: "\$",
            color: Colors.red,
            value: 1234.567,
          ),
          title("Display as a thousand sign"),
          Price(
            thousands: true,
            value: 10010.01,
          ),
        ],
      ),
    );
  }
}
