import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoSwipe extends StatefulWidget {
  @override
  _DemoSwipe createState() => _DemoSwipe();
}

class _DemoSwipe extends State<DemoSwipe> {
  String current = "1";

  @override
  void initState() {
    super.initState();
  }

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 40, 0, 10),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  buildItem(num count) {
    List<Widget> widgets = [];
    for (int i = 1; i <= count; i++) {
      widgets.add(Container(
          color:
              i % 2 == 0 ? Colors.lightBlue : Colors.lightBlue.withOpacity(.8),
          child: Center(
              child: Text(i.toString(),
                  style: TextStyle(fontSize: 20, color: Colors.white)))));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      title("Basic usage"),
      Container(
          height: 220.0,
          child: Swipe(
            autoPlay: true,
            children: <Widget>[
              Image.network("https://img.yzcdn.cn/vant/apple-1.jpg"),
              Image.network("https://img.yzcdn.cn/vant/apple-2.jpg"),
              Image.network("https://img.yzcdn.cn/vant/apple-3.jpg"),
              Image.network("https://img.yzcdn.cn/vant/apple-4.jpg")
            ],
          )),
      title("Monitor change Event"),
      Container(
          height: 220.0,
          child: Swipe(
            autoPlay: true,
            indicatorColor: Colors.white,
            children: buildItem(4),
            // onChange: (val) {
            //   Utils.toast(val);
            // },
          )),
      title("Vertical scroll"),
      Container(
          height: 220.0,
          child: Swipe(
            autoPlay: true,
            scrollDirection: 'vertical',
            indicatorColor: Colors.white,
            children: buildItem(4),
          )),
      title("Custom animation"),
      Container(
          height: 220.0,
          child: Swipe(
            autoPlay: true,
            indicatorColor: Colors.redAccent,
            indicatorSize: 12.0,
            interval: Duration(seconds: 5),
            duration: Duration(seconds: 3),
            children: buildItem(4),
          )),
      title("Set slider ratio"),
      Container(
          height: 220.0,
          child: Swipe(
            autoPlay: true,
            viewportFraction: .5,
            children: <Widget>[
              Image.network("https://img.yzcdn.cn/vant/apple-1.jpg"),
              Image.network("https://img.yzcdn.cn/vant/apple-2.jpg"),
              Image.network("https://img.yzcdn.cn/vant/apple-3.jpg"),
              Image.network("https://img.yzcdn.cn/vant/apple-4.jpg")
            ],
          )),
      title("Custom indicator"),
      Container(
          height: 220.0,
          child: Swipe(
            autoPlay: true,
            children: buildItem(4),
            showIndicators: true,
            onChange: (val) {
              setState(() {
                current = val.toString();
              });
            },
            indicator: Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                // width: 20,
                // height: 20,
                padding: EdgeInsets.all(5),
                color: Colors.black.withOpacity(.2),
                child: Text("$current/4",
                    style: TextStyle(fontSize: 12, color: Colors.white)),
              ),
            ),
          )),
    ]);
  }
}
