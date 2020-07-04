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
          title("显示头像"),
          Skeleton(
            row: 3,
            title: true,
            avatar: true,
            avatarShape: "round",
          ),
          title("显示子组件"),
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
                Text("关于 Vant",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(
                  height: 10,
                ),
                Text("Vant 是一套轻量、可靠的移动端 Vue 组件库，提供了丰富的基础组件和业务组件，帮助开发者快速搭建移动应用。",
                    style: TextStyle(fontSize: 14, height: 1.5))
              ],
            ),
          )
        ]));
  }
}
