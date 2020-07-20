import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoDialog extends StatefulWidget {
  @override
  _DemoDialog createState() => _DemoDialog();
}

class _DemoDialog extends State<DemoDialog> {
  void _showDialog1(BuildContext context) {
    showDialog<dynamic>(
      context: context,
      builder: (_) {
        return NDialog(
          title: 'Title',
          message:
              "The code is written for people to see, and it can run on the machine",
        );
      },
    );
  }

  void _showDialog2(BuildContext context) {
    showDialog<dynamic>(
      context: context,
      builder: (_) {
        return NDialog(
          message:
              "The code is written for people to see, and it can run on the machine",
        );
      },
    );
  }

  void _showDialog3(BuildContext context) {
    showDialog<dynamic>(
      context: context,
      builder: (_) {
        return NDialog(
          title: "Title",
          message:
              "The code is written for people to see, and it can run on the machine",
          showCancelButton: true,
        );
      },
    );
  }

  void _showDialog4(BuildContext context) {
    showDialog<dynamic>(
      context: context,
      builder: (_) {
        return NDialog(
            title: "Title",
            message:
                "The code is written for people to see, and it can run on the machine",
            showCancelButton: true,
            confirmButtonColor: Colors.blueAccent,
            confirmTextColor: Colors.white,
            confirmButtonText: "OK",
            cancelButtonColor: Colors.red,
            cancelTextColor: Colors.white,
            cancelButtonText: "CANCEL",
            titleAlign: AlignmentDirectional.centerStart,
            messageAlign: TextAlign.start);
      },
    );
  }

  void _showDialog5(BuildContext context) {
    showDialog<dynamic>(
      context: context,
      builder: (_) {
        return NDialog(
          title: "title",
          message:
              "The code is written for people to see, and it can run on the machine",
          showCancelButton: true,
          beforeClose: () {
            return Future.delayed(Duration(seconds: 1), () {});
          },
        );
      },
    );
  }

  void _showDialog6(BuildContext context) {
    showDialog<dynamic>(
      context: context,
      builder: (_) {
        return NDialog(
          title: "Title",
          child: Container(
            padding: EdgeInsets.all(24),
            child: Image.network("https://img.yzcdn.cn/vant/apple-1.jpg"),
          ),
          showCancelButton: true,
          beforeClose: () {
            return Future.delayed(Duration(seconds: 1), () {});
          },
        );
      },
    );
  }

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
              NButton(
                text: "Prompt popup",
                type: ButtonType.primary,
                onClick: () {
                  _showDialog1(context);
                },
              ),
              SizedBox(width: 10),
              NButton(
                text: "Prompt popup (untitled)",
                type: ButtonType.primary,
                onClick: () {
                  _showDialog2(context);
                },
              ),
            ],
          ),
          title("Confirm popup"),
          Row(
            children: <Widget>[
              NButton(
                text: "Confirm popup",
                type: ButtonType.primary,
                onClick: () {
                  _showDialog3(context);
                },
              ),
              SizedBox(width: 10),
              NButton(
                text: "Custom confirmation",
                type: ButtonType.primary,
                onClick: () {
                  _showDialog4(context);
                },
              ),
            ],
          ),
          title("Asynchronous call"),
          Row(
            children: <Widget>[
              NButton(
                text: "Asynchronous call",
                type: ButtonType.primary,
                onClick: () {
                  _showDialog5(context);
                },
              ),
            ],
          ),
          title("Custom content"),
          Row(
            children: <Widget>[
              NButton(
                text: "Custom content",
                type: ButtonType.primary,
                onClick: () {
                  _showDialog6(context);
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
