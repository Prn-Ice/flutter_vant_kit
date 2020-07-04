import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

import '../utils/index.dart';

class DemoCollapse extends StatefulWidget {
  @override
  _DemoCollapse createState() => _DemoCollapse();
}

class _DemoCollapse extends State<DemoCollapse> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
        Collapse(
          list: [
            CollapseItem(
              title: "Heading 1",
              content:
                  "The code is written for people to see, and it can run on the machine",
            ),
            CollapseItem(
              title: "Heading 2",
              content:
                  "The code is written for people to see, and it can run on the machine",
            ),
            CollapseItem(
              title: "Heading 3",
              label: "Can't click",
              clickable: false,
              content:
                  "The code is written for people to see, and it can run on the machine",
            )
          ],
          onChange: (List list) {
            Utils.toast("Expanded! $list");
          },
        ),
        title("Accordion"),
        Collapse(
          accordion: true,
          name: ['0'],
          list: [
            CollapseItem(
              title: "Heading 1",
              content:
                  "The code is written for people to see, and it can run on the machine",
            ),
            CollapseItem(
              title: "Heading 2",
              content:
                  "The code is written for people to see, and it can run on the machine",
            ),
            CollapseItem(
              title: "Heading 3",
              content:
                  "The code is written for people to see, and it can run on the machine",
            )
          ],
        ),
        title("Custom Heading content"),
        Collapse(
          border: false,
          list: [
            CollapseItem(
              title: "Heading 1",
              customTitle: Padding(
                padding: EdgeInsets.only(left: 6),
                child: Icon(Icons.info_outline,
                    color: Colors.blueAccent, size: 16),
              ),
              name: 'a',
              rightIcon:
                  Icon(Icons.favorite, size: 16, color: Colors.blueAccent),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                    "The code is written for people to see, and it can run on the machine",
                    style: TextStyle(color: Colors.red, fontSize: 12)),
              ),
            ),
            CollapseItem(
              title: "Heading 2",
              name: 'b',
              value: "content",
              icon: Icons.store,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Image.network("https://img.yzcdn.cn/vant/apple-1.jpg"),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
