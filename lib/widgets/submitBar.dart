import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/theme/style.dart';
import 'package:flutter_vant_kit/widgets/button.dart';
import 'package:flutter_vant_kit/widgets/price.dart';

class SubmitBar extends StatelessWidget {
  /// Price
  final double price;

  /// Price left copy
  final String label;

  /// Copy right
  final String suffixLabel;

  /// Price copy alignment
  final String textAlign;

  /// Button text
  final String buttonText;

  /// Cue copy
  final String tip;

  /// Left icon
  final IconData tipIcon;

  /// Whether to disable the button
  final bool disabled;

  /// Is loading
  final bool loading;

  /// currency symbol
  final String currency;

  /// Price decimal place
  final int decimalLength;

  /// Button click event callback
  final Function() onSubmit;

  /// Tips for additional operations and instructions in copy
  final Widget customTip;

  /// Customize the content above the order bar
  final Widget customTop;

  /// Customize the left side of the order bar
  final Widget customLeft;

  const SubmitBar(
      {Key key,
      this.price,
      this.label: "total:",
      this.suffixLabel,
      this.textAlign: "right",
      this.buttonText,
      this.tip,
      this.tipIcon,
      this.disabled: false,
      this.loading: false,
      this.currency: "¥",
      this.decimalLength: 2,
      this.onSubmit,
      this.customTip,
      this.customTop,
      this.customLeft})
      : super(key: key);

  Widget buildTip() {
    return Container(
      padding: Style.submitBarTipPadding,
      color: Style.submitBarTipBackgroundColor,
      child: Row(
        children: <Widget>[
          tipIcon != null
              ? Icon(tipIcon,
                  color: Style.submitBarTipColor,
                  size: Style.submitBarTipIconSize)
              : Container(),
          SizedBox(width: tipIcon != null ? Style.intervalSm : 0),
          Text("$tip",
              style: TextStyle(
                  fontSize: Style.submitBarTipFontSize,
                  color: Style.submitBarTipColor)),
          customTip ?? Container()
        ],
      ),
    );
  }

  Widget buildContent() {
    return Container(
      height: Style.submitBarHeight,
      padding: Style.submitBarPadding,
      color: Style.submitBarBackgroundColor,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: textAlign == "right"
                  ? (customLeft != null
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.end)
                  : MainAxisAlignment.start,
              children: <Widget>[
                customLeft ?? Container(),
                SizedBox(width: customLeft != null ? Style.intervalSm : 0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text("$label",
                        style: TextStyle(
                            fontSize: Style.submitBarTextFontSize,
                            color: Style.submitBarTextColor)),
                    Price(
                        value: price,
                        currency: currency,
                        size: Style.submitBarPriceFontSize,
                        color: Style.submitBarPriceColor,
                        decimal: decimalLength)
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            width: Style.paddingSm,
          ),
          NButton(
            text: loading ? "" : buttonText,
            round: true,
            color: Style.submitBarButtonColor,
            /*width: Style.submitBarButtonWidth,
            height: Style.submitBarButtonHeight,*/
            loading: loading,
            disabled: disabled,
            onClick: () {
              if (onSubmit != null) onSubmit();
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        tip != null ? buildTip() : Container(),
        customTop ?? Container(),
        buildContent()
      ],
    );
  }
}
