import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoLoading extends StatefulWidget {
  @override
  _DemoLoading createState() => _DemoLoading();
}

class _DemoLoading extends State<DemoLoading> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
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
          Loading(),
          title("Custom colors"),
          Loading(
            color: Colors.blueAccent,
          ),
          title("Load copy"),
          Loading(
            color: Colors.blueAccent,
            text: "Loading...",
          ),
          title("Vertical arrangement"),
          Loading(
            color: Colors.blueAccent,
            text: "Loading...",
            size: 20,
            vertical: true,
          ),
          title("Customize Loading"),
          Container(
            width: 150,
            child: Loading(
              loading: Image.network(
                  "https://loading.io/mod/spinner/lava-lamp/sample.gif"),
              text: "Loading...",
            ),
          ),
          title("Display Loading"),
          NButton(
            text: "Show loading",
            type: "primary",
            onClick: () {
              showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) {
                    return Center(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: Colors.white),
                        padding: EdgeInsets.all(20),
                        child: Loading(
                          color: Colors.blueAccent,
                          text: "Loading...",
                        ),
                      ),
                    );
                  });
            },
          )
        ],
      ),
    );
  }
}
