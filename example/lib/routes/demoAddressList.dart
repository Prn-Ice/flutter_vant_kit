import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

import '../utils/index.dart';

class DemoAddressList extends StatefulWidget {
  @override
  _DemoAddressList createState() => _DemoAddressList();
}

class _DemoAddressList extends State<DemoAddressList> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<AddressInfo> list = [
      AddressInfo(
          name: "Zhang San",
          tel: "234123",
          province: "Guangdong Province",
          city: "Shenzhen",
          county: "Minamiyama Ward",
          addressDetail: "Pearl Garden",
          postalCode: "515000",
          isDefault: true),
      AddressInfo(
          name: "Li Si",
          tel: "18345234123",
          province: "Guangdong Province",
          city: "Shenzhen",
          county: "Minamiyama Ward",
          addressDetail: "Pearl Garden in Baishi Street",
          postalCode: "515000",
          isDefault: false),
    ];
    List<AddressInfo> disabledList = [
      AddressInfo(
          name: "Wang Wu",
          tel: "18345234123",
          province: "Guangdong Province",
          city: "Shenzhen",
          county: "Minamiyama Ward",
          addressDetail: "Pearl Garden",
          postalCode: "515000",
          isDefault: false)
    ];

    return AddressList(
      id: 0,
      list: list,
      top: title("Basic usage"),
      disabledList: disabledList,
      onSelect: (item, i) {
        Utils.toast(item.toString());
      },
      onEdit: (item, i) {
        Utils.toast("edit");
      },
      onAdd: () {
        Utils.toast('add');
      },
    );
  }
}
