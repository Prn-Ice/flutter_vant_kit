import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

import '../utils/index.dart';

class DemoNoticeBar extends StatefulWidget {
  @override
  _DemoNoticeBar createState() => _DemoNoticeBar();
}

class _DemoNoticeBar extends State<DemoNoticeBar> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 30, 0, 10),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        title("Basic usage"),
        NoticeBar(
          text:
              "The FA Cup front staged the Guangzhou Derby for the second year in a row. Last season, Evergrande eliminated R&F with a total score of 5-3 in two rounds.",
          leftIcon: Icons.volume_up,
        ),
        title("No scrolling"),
        NoticeBar(
          scrollable: false,
          leftIcon: Icons.volume_up,
          text:
              "The FA Cup front staged the Guangzhou Derby for the second year in a row. Last season, Evergrande eliminated R&F with a total score of 5-3 in two rounds.",
        ),
        title("Multi-line display"),
        NoticeBar(
          scrollable: false,
          wrapable: true,
          text:
              "The FA Cup front staged the Guangzhou Derby for the second year in a row. Last season, Evergrande eliminated R&F with a total score of 5-3 in two rounds.",
        ),
        title("Notification bar mode"),
        NoticeBar(
          text:
              "The FA Cup front staged the Guangzhou Derby for the second year in a row. Last season, Evergrande eliminated R&F with a total score of 5-3 in two rounds.",
          mode: "closeable",
          onClose: () {
            Utils.toast("NoticeBar closed");
          },
        ),
        SizedBox(
          height: 4,
        ),
        NoticeBar(
          text:
              "The FA Cup front staged the Guangzhou Derby for the second year in a row. Last season, Evergrande eliminated R&F with a total score of 5-3 in two rounds.",
          mode: "link",
          onClick: () {
            Utils.toast("NoticeBar clicked");
          },
        ),
        title("Custom style"),
        NoticeBar(
          text:
              "The FA Cup front staged the Guangzhou Derby for the second year in a row. Last season, Evergrande eliminated R&F with a total score of 5-3 in two rounds.",
          leftIcon: Icons.info_outline,
          background: Color(0xffecf9ff),
          color: Color(0xff1989fa),
        )
      ],
    );
  }
}
