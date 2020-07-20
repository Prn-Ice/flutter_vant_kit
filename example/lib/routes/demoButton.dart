import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoButton extends StatefulWidget {
  @override
  _DemoButton createState() => _DemoButton();
}

class _DemoButton extends State<DemoButton> {
  bool _loading = false;
  Timer _timer;

  @override
  void initState() {
    super.initState();
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
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            title("Default button"),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: <Widget>[
                NButton(
                  text: "Default button",
                  onClick: () {},
                ),
                NButton(
                  text: "Main button",
                  type: ButtonType.primary,
                  onClick: () {},
                ),
                NButton(
                  text: "Information button",
                  type: ButtonType.info,
                  onClick: () {},
                ),
                NButton(
                  text: "Danger button",
                  type: ButtonType.danger,
                  onClick: () {},
                ),
                NButton(
                  text: "Warning button",
                  type: ButtonType.warning,
                  onClick: () {},
                ),
              ],
            ),
            title("Naive button"),
            Wrap(
              spacing: 12,
              children: <Widget>[
                NButton(
                  plain: true,
                  text: "Naive button",
                  type: ButtonType.primary,
                  onClick: () {},
                ),
                NButton(
                  plain: true,
                  text: "Naive button",
                  type: ButtonType.info,
                  onClick: () {},
                )
              ],
            ),
            title("Thin border"),
            Wrap(
              spacing: 12,
              children: <Widget>[
                NButton(
                  plain: true,
                  hairline: true,
                  text: "Thin border button",
                  type: ButtonType.primary,
                  onClick: () {},
                ),
                NButton(
                  plain: true,
                  hairline: true,
                  text: "Thin border button",
                  type: ButtonType.info,
                  onClick: () {},
                )
              ],
            ),
            title("Disabled"),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: <Widget>[
                NButton(
                  disabled: true,
                  text: "Disabled",
                ),
                NButton(
                  disabled: true,
                  text: "Disabled",
                  type: ButtonType.primary,
                ),
                NButton(
                  plain: true,
                  disabled: true,
                  text: "Disabled",
                  type: ButtonType.info,
                )
              ],
            ),
            title("Loading state"),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: <Widget>[
                NButton(
                  loading: true,
                  type: ButtonType.primary,
                ),
                NButton(
                  loading: true,
                  text: "Loading...",
                  type: ButtonType.primary,
                ),
                NButton(
                  plain: true,
                  loading: _loading,
                  text: "Recover after clicking 2 S",
                  type: ButtonType.info,
                  onClick: () {
                    setState(() {
                      _loading = true;
                    });
                    int count = 2;
                    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
                      setState(() {
                        if (count < 1) {
                          _timer.cancel();
                          _loading = false;
                        } else {
                          count -= 1;
                        }
                      });
                    });
                  },
                )
              ],
            ),
            title("Button shape"),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: <Widget>[
                NButton(
                  text: "Square button",
                  type: ButtonType.primary,
                  square: true,
                  onClick: () {},
                ),
                NButton(
                  text: "Round button",
                  type: ButtonType.info,
                  round: true,
                  onClick: () {},
                ),
                NButton(
                  plain: true,
                  text: "Round button",
                  type: ButtonType.primary,
                  round: true,
                  onClick: () {},
                ),
                NButton(
                  block: true,
                  text: "Block level buttons",
                  type: ButtonType.info,
                  onClick: () {},
                )
              ],
            ),
            title("Icon border"),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: <Widget>[
                NButton(
                  icon: Icon(Icons.star_border, color: Colors.white, size: 18),
                  type: ButtonType.primary,
                  onClick: () {},
                ),
                NButton(
                  text: "push button",
                  icon: Icon(Icons.star_border, color: Colors.white, size: 18),
                  type: ButtonType.primary,
                  onClick: () {},
                ),
                NButton(
                  text: "push button",
                  plain: true,
                  icon: SizedBox(
                    width: 18,
                    child: Image.network("https://img.yzcdn.cn/vant/logo.png"),
                  ),
                  type: ButtonType.primary,
                  onClick: () {},
                )
              ],
            ),
            title("Button size"),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                NButton(
                  type: ButtonType.primary,
                  size: ButtonSize.large,
                  text: "Large button",
                  onClick: () {},
                ),
                NButton(
                  type: ButtonType.primary,
                  size: ButtonSize.normal,
                  text: "Normal button",
                  onClick: () {},
                ),
                NButton(
                  type: ButtonType.primary,
                  size: ButtonSize.small,
                  text: "Small button",
                  onClick: () {},
                ),
                NButton(
                  type: ButtonType.primary,
                  size: ButtonSize.mini,
                  text: "Mini button",
                  onClick: () {},
                ),
              ],
            ),
            title("Custom colors"),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: <Widget>[
                NButton(
                  text: "Monochrome button",
                  color: Colors.purple,
                  onClick: () {},
                ),
                NButton(
                  text: "Monochrome button",
                  color: Colors.purple,
                  plain: true,
                  onClick: () {},
                ),
                NButton(
                  text: "Gradient button",
                  color: LinearGradient(
                      colors: [Colors.lightBlue[300], Colors.blueAccent]),
                  onClick: () {},
                ),
                NButton(
                  text: "Gradient button",
                  color: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.greenAccent, Colors.redAccent]),
                  onClick: () {},
                ),
                NButton(
                  text: "Gradient button",
                  color: RadialGradient(
                      radius: 2,
                      colors: [Colors.lightBlue[300], Colors.blueAccent]),
                  onClick: () {},
                ),
              ],
            ),
            SizedBox(height: 20)
          ],
        ));
  }
}
