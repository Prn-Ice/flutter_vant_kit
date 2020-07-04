import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

import '../utils/index.dart';

class DemoImagePreview extends StatefulWidget {
  @override
  _DemoImagePreview createState() => _DemoImagePreview();
}

class _DemoImagePreview extends State<DemoImagePreview> {
  List<Widget> images = [
    Image.network("https://img.yzcdn.cn/vant/apple-1.jpg"),
    Image.network("https://img.yzcdn.cn/vant/apple-2.jpg"),
    Image.network("https://img.yzcdn.cn/vant/apple-3.jpg"),
    Image.network("https://img.yzcdn.cn/vant/apple-4.jpg")
  ];

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
          NButton(
            text: "preview picture",
            type: "primary",
            onClick: () {
              showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return ImagePreview(
                      images: images,
                    );
                  });
            },
          ),
          title("Specify initial position"),
          NButton(
            text: "Specify initial position",
            type: "primary",
            onClick: () {
              showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return ImagePreview(
                        images: images,
                        showIndicators: true,
                        startPosition: 2,
                        swipeDuration: Duration(seconds: 2),
                        onChange: (val) {
                          Utils.toast("Page Changed $val");
                        });
                  });
            },
          )
        ]));
  }
}
