import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

import '../utils/index.dart';

class DemoSearch extends StatefulWidget {
  @override
  _DemoSearch createState() => _DemoSearch();
}

class _DemoSearch extends State<DemoSearch> {
  IconData _icon = Icons.star_border;
  Color _color = Colors.grey;

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
          title("Basic usage"),
          Search(),
          title("Event monitoring"),
          Search(
            showAction: true,
            onSubmitted: (val) {
              Utils.toast("searching $val");
            },
            onCancel: () {
              Utils.toast("canceled");
            },
          ),
          title("Custom style"),
          Search(
            shape: "round",
            background: Color(0xfff2f3DA),
            showAction: true,
            maxLength: 16,
            placeholder: "Please enter anything",
          ),
          title("Custom button"),
          Search(
            showAction: true,
            left: Row(
              children: <Widget>[
                Text("Address"),
                SizedBox(width: 6),
                GestureDetector(
                  child: Icon(_icon, color: _color, size: 18),
                  onTap: () {
                    setState(() {
                      _icon = Icons.star;
                      _color = Colors.orangeAccent;
                    });
                  },
                )
              ],
            ),
            rightIcon: Icons.search,
            onClickRight: () {
              Utils.toast("clicked Right Icon");
            },
            right: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Utils.toast("clicked Right");
                  },
                  child: Text("search"),
                ),
                SizedBox(width: 4),
                Text("collect")
              ],
            ),
          )
        ]));
  }
}
