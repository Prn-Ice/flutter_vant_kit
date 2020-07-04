import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

import '../utils/index.dart';

class DemoTreeSelect extends StatefulWidget {
  @override
  _DemoTreeSelect createState() => _DemoTreeSelect();
}

class _DemoTreeSelect extends State<DemoTreeSelect> {
  String _info = "NEW";
  int _index = 0;

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 30, 0, 20),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<SideBarItem> list1 = [
      SideBarItem(title: "Zhejiang", children: [
        TreeItem(text: "Hangzhou", id: 1),
        TreeItem(text: "Wenzhou", id: 2),
        TreeItem(text: "Ningbo", id: 3, disabled: true),
        TreeItem(text: "Yiwu", id: 4),
      ]),
      SideBarItem(title: "Jiangsu Province", children: [
        TreeItem(text: "Nanjing", id: 5),
        TreeItem(text: "Wuxi", id: 6),
        TreeItem(text: "Xuzhou", id: 7),
        TreeItem(text: "Suzhou", id: 8),
      ]),
      SideBarItem(title: "Fujian Province", disabled: true, children: [
        TreeItem(text: "Quanzhou", id: 9),
        TreeItem(text: "xiamen", id: 10),
      ]),
    ];

    List<SideBarItem> list2 = [
      SideBarItem(
          title: "Grouping 1",
          content: Container(
            padding: EdgeInsets.all(10.0),
            child: Image.network("https://img.yzcdn.cn/vant/cat.jpeg"),
          )),
      SideBarItem(
          title: "Grouping 2",
          content: Container(
            padding: EdgeInsets.all(10.0),
            child: Image.network("https://img.yzcdn.cn/vant/apple-1.jpg"),
          )),
    ];

    List<SideBarItem> list3 = [
      SideBarItem(
        title: "Zhejiang",
        children: [
          TreeItem(text: "Hangzhou", id: 1),
          TreeItem(text: "Wenzhou", id: 2),
          TreeItem(text: "Ningbo", id: 3, disabled: true),
          TreeItem(text: "Yiwu", id: 4),
        ],
      ),
      SideBarItem(
        title: "Jiangsu Province",
        info: _info,
        children: [
          TreeItem(text: "Nanjing", id: 5),
          TreeItem(text: "Wuxi", id: 6),
          TreeItem(text: "Xuzhou", id: 7),
          TreeItem(text: "Suzhou", id: 8),
        ],
        // onClick: (val) {
        // setState(() {
        //   if (_info != null) {
        //     _info = null;
        //     _index = val;
        //   }
        // });
        // }
      ),
    ];
    return SingleChildScrollView(
        padding: EdgeInsets.all(0.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              title("Radio mode"),
              TreeSelect(
                activeId: [1],
                list: list1,
              ),
              title("Multi-select mode"),
              TreeSelect(
                activeId: [1],
                list: list1,
                max: 3,
                onChange: (list) {
                  Utils.toast(list.toString());
                },
              ),
              title("Custom content"),
              TreeSelect(
                list: list2,
                height: 200,
              ),
              title("Prompt message"),
              TreeSelect(
                mainActiveIndex: _index,
                list: list3,
                activeId: [1],
                height: 220,
              ),
              SizedBox(height: 20)
            ]));
  }
}
