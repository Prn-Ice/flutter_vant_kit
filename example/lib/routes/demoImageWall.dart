import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

import '../utils/index.dart';

class DemoImageWall extends StatefulWidget {
  @override
  _DemoImageWall createState() => _DemoImageWall();
}

class _DemoImageWall extends State<DemoImageWall> {
  List<String> images = [
    "https://img.yzcdn.cn/vant/leaf.jpg",
    "https://img.yzcdn.cn/vant/tree.jpg",
    "https://img.yzcdn.cn/vant/sand.jpg",
  ];

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
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
        ImageWall(
          images: images,
          count: 6,
          onUpload: (files) async {
            return Utils.toast(files.toString());
          },
          onChange: (image) {},
        ),
        title("Multi-select pictures"),
        ImageWall(
          images: images,
          count: 6,
          multiple: true,
          onUpload: (files) async {
            return Utils.toast(files.toString());
          },
          onChange: (image) {},
        ),
        // title("Customize the number of each line"),
        // ImageWall(
        //   images: images,
        //   length: 3,
        //   onUpload: (files) async {},
        //   onChange: (image) {},
        // ),
        title("Image zoom mode"),
        ImageWall(
          images: images,
          imageFit: BoxFit.contain,
          onUpload: (files) async {
            return Utils.toast(files.toString());
          },
          onChange: (image) {},
        )
      ],
    ));
  }
}
