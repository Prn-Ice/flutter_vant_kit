import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

import '../utils/index.dart';

class DemoAddressEdit extends StatefulWidget {
  @override
  _DemoAddressEdit createState() => _DemoAddressEdit();
}

class _DemoAddressEdit extends State<DemoAddressEdit> {
  var textController = TextEditingController();

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
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
          AddressEdit(
            showDelete: true,
            showSetDefault: true,
            addressInfo: <String, dynamic>{
              "name": "Zhang San",
              "tel": "18345234123",
              "province": "Guangdong Province",
              "city": "Shenzhen",
              "county": "Minamiyama Ward",
              "provinceId": 0,
              "cityId": 1,
              "countyId": 0,
              "addressDetail": "Pearl Garden",
              "postalCode": "515000",
              "isDefault": true
            },
            children: <Widget>[
              Field(
                label: "Remarks",
                placeholder: "Please enter a remark",
                controller: textController,
              )
            ],
            onSave: (map) {
              Utils.toast("Saved! ${map.toString()}");
            },
          )
        ],
      ),
    );
  }
}
