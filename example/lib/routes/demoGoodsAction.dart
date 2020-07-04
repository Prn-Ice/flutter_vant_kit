import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoGoodsAction extends StatefulWidget {
  @override
  _DemoGoodsAction createState() => _DemoGoodsAction();
}

class _DemoGoodsAction extends State<DemoGoodsAction> {
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
          GoodsAction(
            actions: [
              ActionButtonItem(
                  text: "Customer service", icon: Icons.chat_bubble_outline),
              ActionButtonItem(
                  text: "shopping cart", icon: Icons.add_shopping_cart),
            ],
            buttons: [
              ButtonItem(
                  text: "add to Cart",
                  color: LinearGradient(
                      colors: [Color(0xffffd01e), Color(0xffff8917)])),
              ButtonItem(
                  text: "Buy now",
                  color: LinearGradient(
                      colors: [Color(0xffff6034), Color(0xffee0a24)])),
            ],
          ),
          title("Logo tips"),
          GoodsAction(
            actions: [
              ActionButtonItem(
                  text: "Customer service", icon: Icons.chat_bubble_outline),
              ActionButtonItem(
                  text: "shopping cart",
                  icon: Icons.add_shopping_cart,
                  info: "5"),
              ActionButtonItem(text: "Shop", icon: Icons.store, info: "12"),
            ],
            buttons: [
              ButtonItem(
                  text: "add to Cart",
                  color: LinearGradient(
                      colors: [Color(0xffffd01e), Color(0xffff8917)])),
              ButtonItem(
                  text: "Buy now",
                  color: LinearGradient(
                      colors: [Color(0xffff6034), Color(0xffee0a24)])),
            ],
          ),
          title("Loading and disabling status"),
          GoodsAction(
            actions: [
              ActionButtonItem(
                  text: "Customer service", icon: Icons.chat_bubble_outline),
              ActionButtonItem(
                  text: "shopping cart", icon: Icons.add_shopping_cart),
            ],
            buttons: [
              ButtonItem(
                  text: "add to Cart",
                  disabled: true,
                  color: LinearGradient(
                      colors: [Color(0xffffd01e), Color(0xffff8917)])),
              ButtonItem(
                  text: "Buy now",
                  loading: true,
                  color: LinearGradient(
                      colors: [Color(0xffff6034), Color(0xffee0a24)])),
            ],
          ),
          title("Custom content"),
          GoodsAction(
            actions: [
              ActionButtonItem(
                  customText: Text("Customer",
                      style: TextStyle(color: Colors.blueAccent, fontSize: 12)),
                  customIcon: Icon(Icons.chat_bubble_outline,
                      color: Colors.blueAccent, size: 16)),
              ActionButtonItem(
                  text: "shopping cart", icon: Icons.add_shopping_cart),
            ],
            buttons: [
              ButtonItem(text: "add to Cart", color: Color(0xffbe99ff)),
              ButtonItem(text: "Buy now", color: Color(0xff7232dd)),
            ],
          ),
        ],
      ),
    );
  }
}
