import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoSteps extends StatefulWidget {
  @override
  _DemoSteps createState() => _DemoSteps();
}

class _DemoSteps extends State<DemoSteps> {
  int _active = 1;

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 30, 0, 10),
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
          Steps(steps: [
            StepItem("买家下单"),
            StepItem("商家接单"),
            StepItem("买家提货"),
            StepItem("交易完成"),
          ], active: _active),
          Padding(
              padding: EdgeInsets.all(20),
              child: Wrap(
                runSpacing: 10,
                children: <Widget>[
                  NButton(
                    text: "上一步",
                    type: "primary",
                    plain: true,
                    onClick: () {
                      setState(() {
                        _active -= 1;
                        if (_active < 0) _active = 3;
                      });
                    },
                  ),
                  SizedBox(width: 6),
                  NButton(
                    text: "下一步",
                    type: "primary",
                    plain: true,
                    onClick: () {
                      setState(() {
                        _active += 1;
                        if (_active > 3) _active = 0;
                      });
                    },
                  ),
                ],
              )),
          title("Custom style"),
          Steps(
            steps: [
              StepItem("买家下单"),
              StepItem("商家接单"),
              StepItem("买家提货"),
              StepItem("交易完成"),
            ],
            active: _active,
            activeIcon: Icons.done,
            inactiveIcon: Icons.chevron_right,
            activeColor: Colors.blueAccent,
          ),
          title("竖向步骤条"),
          Steps(
            steps: [
              StepItem("【城市】物流状态1", "2016-07-12 12:40"),
              StepItem("【城市】物流状态2", "2016-07-12 12:40"),
              StepItem("【城市】物流状态3", "2016-07-12 12:40"),
              StepItem("【城市】快件已发货", "2016-07-12 12:40"),
            ],
            active: _active,
            direction: 'vertical',
          ),
        ]));
  }
}
