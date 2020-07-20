import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

import '../utils/index.dart';

class DemoTag extends StatefulWidget {
  @override
  _DemoTag createState() => _DemoTag();
}

class _DemoTag extends State<DemoTag> {
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
        Row(
          children: <Widget>[
            Tag(text: "Tag"),
            Tag(type: TagType.primary, text: "Tag"),
            Tag(type: TagType.success, text: "Tag"),
            Tag(type: TagType.danger, text: "Tag"),
            Tag(type: TagType.warning, text: "Tag"),
          ],
        ),
        title("Rounded corner style"),
        Row(
          children: <Widget>[
            Tag(
              text: "Tag",
              round: true,
            ),
            Tag(
              type: TagType.primary,
              text: "Tag",
              round: true,
            ),
            Tag(
              type: TagType.success,
              text: "Tag",
              round: true,
            ),
            Tag(
              type: TagType.danger,
              text: "Tag",
              round: true,
            ),
            Tag(
              type: TagType.warning,
              text: "Tag",
              round: true,
            ),
          ],
        ),
        title("Mark style"),
        Row(
          children: <Widget>[
            Tag(
              text: "Tag",
              mark: true,
            ),
            Tag(
              type: TagType.primary,
              text: "Tag",
              mark: true,
            ),
            Tag(
              type: TagType.success,
              text: "Tag",
              mark: true,
            ),
            Tag(
              type: TagType.danger,
              text: "Tag",
              mark: true,
            ),
            Tag(
              type: TagType.warning,
              text: "Tag",
              mark: true,
            ),
          ],
        ),
        title("Hollow style"),
        Row(
          children: <Widget>[
            Tag(
              text: "Tag",
              plain: true,
            ),
            Tag(
              type: TagType.primary,
              text: "Tag",
              plain: true,
            ),
            Tag(
              type: TagType.success,
              text: "Tag",
              plain: true,
            ),
            Tag(
              type: TagType.danger,
              text: "Tag",
              plain: true,
            ),
            Tag(
              type: TagType.warning,
              text: "Tag",
              plain: true,
            ),
          ],
        ),
        title("Custom colors"),
        Row(children: <Widget>[
          Tag(color: Colors.pinkAccent, text: "Tag"),
          Tag(color: Colors.pinkAccent, plain: true, text: "Tag"),
          Tag(color: Colors.purple, text: "Tag"),
          Tag(color: Colors.purple, plain: true, text: "Tag"),
          Tag(color: Colors.red[100], textColor: Colors.red[600], text: "Tag"),
        ]),
        title("Tag size"),
        Row(children: <Widget>[
          Tag(
            text: "Tag",
            type: TagType.success,
          ),
          Tag(
            text: "Tag",
            size: TagSize.medium,
            type: TagType.success,
          ),
          Tag(
            text: "Tag",
            size: TagSize.large,
            type: TagType.success,
          ),
        ]),
        title("Tag can be closed"),
        Row(children: <Widget>[
          Tag(
            text: "Tag",
            onClose: () async {
              Utils.toast("close");
            },
          ),
          Tag(
            type: TagType.primary,
            text: "Tag",
            onClose: () async {
              Utils.toast("close");
            },
          ),
          Tag(
            plain: true,
            round: true,
            type: TagType.primary,
            text: "Tag",
            onClose: () async {
              Utils.toast("close");
            },
          )
        ])
      ],
    ));
  }
}
