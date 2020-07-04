import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoSkeleton extends StatefulWidget {
  @override
  _DemoSkeleton createState() => _DemoSkeleton();
}

class _DemoSkeleton extends State<DemoSkeleton> {
  bool _loading = true;

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
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
          Skeleton(
            row: 3,
            title: true,
          ),
          title("Show avatar"),
          Skeleton(
            row: 3,
            title: true,
            avatar: true,
            avatarShape: "round",
          ),
          title("Show subcomponents"),
          CupertinoSwitch(
            value: _loading,
            // activeColor: Colors.red, //选中时的颜色
            onChanged: (value) {
              setState(() {
                _loading = value;
              });
            },
          ),
          SizedBox(height: 6),
          Skeleton(
            row: 3,
            title: true,
            avatarShape: "round",
            loading: !_loading,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("with respect to Vant",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "Vant Is a set of lightweight and reliable mobile terminal Vue The component library provides a wealth of basic components and business components to help developers quickly build mobile applications.",
                    style: TextStyle(fontSize: 14, height: 1.5))
              ],
            ),
          )
        ]));
  }
}
