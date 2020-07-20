import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

import '../utils/index.dart';

class DemoCell extends StatefulWidget {
  @override
  _DemoCell createState() => _DemoCell();
}

class _DemoCell extends State<DemoCell> {
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
          CellGroup(children: <Widget>[
            Cell(title: "Cell", value: "contents"),
            Cell(
                title: "Cell",
                value: "contents",
                label: "Description",
                require: true),
          ]),
          title("Cell size"),
          CellGroup(children: <Widget>[
            Cell(title: "Cell", value: "contents", size: CellSize.large),
            Cell(
                title: "Cell",
                value: "contents",
                size: CellSize.large,
                label: "Description"),
          ]),
          title("Display icon"),
          CellGroup(children: <Widget>[
            Cell(title: "Cell", value: "contents", icon: Icons.my_location),
          ]),
          title("Set only value"),
          CellGroup(children: <Widget>[
            Cell(value: "contents"),
          ]),
          title("Clickable"),
          CellGroup(children: <Widget>[
            Cell(
              title: "Cell",
              isLink: true,
              onClick: () {
                Utils.toast("Clicked");
              },
            ),
            Cell(
              title: "Cell",
              value: "contents",
              isLink: true,
              onClick: () {
                Utils.toast("Clicked");
              },
            ),
            Cell(
              title: "Cell",
              value: "contents",
              label: "Description",
              arrowDirection: "down",
              isLink: true,
              onClick: () {
                Utils.toast("Clicked");
              },
            ),
          ]),
          title("Group header"),
          CellGroup(title: "Grouping 1", children: <Widget>[
            Cell(title: "Cell", value: "contents"),
          ]),
          CellGroup(title: "Grouping 2", children: <Widget>[
            Cell(title: "Cell", value: "contents"),
          ]),
          title("Custom slot"),
          CellGroup(children: <Widget>[
            Cell(
              customTitle: Row(
                children: <Widget>[
                  Text("Custom title"),
                  SizedBox(width: 4),
                  Tag(
                    text: "tag",
                    color: Colors.blueAccent,
                  )
                ],
              ),
              value: "contents",
              isLink: true,
            ),
            Cell(
                title: "Cell",
                icon: Icons.store,
                customRight:
                    Icon(Icons.search, color: Colors.blueAccent, size: 16))
          ]),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
