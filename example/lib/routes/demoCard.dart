import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

import '../utils/index.dart';

class DemoCard extends StatefulWidget {
  @override
  _DemoCard createState() => _DemoCard();
}

class _DemoCard extends State<DemoCard> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
          NCard(
              title: "product name",
              desc: "Description",
              num: 2,
              price: 2.00,
              image: Image.network("https://img.yzcdn.cn/vant/t-thirt.jpg")),
          title("Marketing information"),
          NCard(
            title: "product name",
            desc: "Description",
            num: 2,
            price: 2.00,
            tag: "Tag",
            originPrice: 10.00,
            image: Image.network("https://img.yzcdn.cn/vant/t-thirt.jpg"),
            onClick: () {
              Utils.toast("Clicked");
            },
          ),
          title("Custom content"),
          NCard(
            customTitle: Text("product name",
                style: TextStyle(fontSize: 16, color: Colors.blueAccent)),
            desc: "Description",
            num: 2,
            customPrice: Price(
              value: 2.0,
              color: Colors.red,
            ),
            image: Image.network("https://img.yzcdn.cn/vant/t-thirt.jpg"),
            customTags: Row(
              children: <Widget>[
                Tag(text: "Tag", plain: true),
                Tag(text: "Tag", plain: true)
              ],
            ),
            customFooter: Padding(
              padding: EdgeInsets.only(top: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  NButton(
                    text: "push button",
                    round: true,
                    size: ButtonSize.mini,
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 12),
                  ),
                  SizedBox(width: 6),
                  NButton(
                    text: "push button",
                    round: true,
                    size: ButtonSize.mini,
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 12),
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}
