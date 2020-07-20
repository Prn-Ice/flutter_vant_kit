import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/theme/style.dart';

enum ButtonType {
  normal,
  primary,
  info,
  danger,
  warning,
}
enum ButtonSize {
  mini,
  small,
  normal,
  large,
}

class NButton extends StatelessWidget {
  // type
  final ButtonType type;
  // size
  final ButtonSize size;
  // buttonText
  final String text;
  // button width
  final double width;
  // Button height
  final double height;
  // Button color
  final dynamic color;
  // Left icon
  final Widget icon;
  // button text color
  final Color textColor;
  // Whether it is a block-level element
  final bool block;
  // Whether it is a plain button
  final bool plain;
  // Whether it is a square button
  final bool square;
  // Whether it is a round button
  final bool round;
  // Whether to disable the button
  final bool disabled;
  // Is it loading
  final bool loading;
  // use or not 0.5px 边框
  final bool hairline;
  // Custom padding
  final EdgeInsets padding;
  // Custom button rounded corners
  final BorderRadius borderRadius;
  // Callback after clicking
  final Function() onClick;

  NButton(
      {Key key,
      this.type: ButtonType.normal,
      this.size: ButtonSize.normal,
      this.text,
      this.width,
      this.height,
      this.color,
      this.textColor,
      this.icon,
      this.block: false,
      this.plain: false,
      this.square: false,
      this.round: false,
      this.disabled: false,
      this.hairline: false,
      this.loading: false,
      this.padding,
      this.borderRadius,
      this.onClick})
      : assert(size != null, "size must be mini, small, normal, or large"),
        assert(type != null,
            "type must be default, primary, info, danger or warning"),
        super(key: key);

  final Map<ButtonSize, dynamic> sizes = {
    ButtonSize.mini: <String, dynamic>{
      "fontSize": Style.buttonMiniFontSize,
      "padding": EdgeInsets.symmetric(horizontal: 2),
      "height": Style.buttonMiniHeight
    },
    ButtonSize.small: <String, dynamic>{
      "fontSize": Style.buttonSmallFontSize,
      "padding": EdgeInsets.symmetric(horizontal: 8),
      "height": Style.buttonSmallHeight
    },
    ButtonSize.normal: <String, dynamic>{
      "fontSize": Style.buttonDefaultFontSize,
      "padding": EdgeInsets.symmetric(horizontal: 15),
      "height": Style.buttonDefaultHeight
    },
    ButtonSize.large: <String, dynamic>{
      "fontSize": Style.buttonLargeFontSize,
      "padding": EdgeInsets.symmetric(horizontal: 24),
      "height": Style.buttonLargeHeight
    },
  };

  final Map<ButtonType, dynamic> colors = {
    ButtonType.normal: <String, Color>{
      "buttonColor": Style.buttonDefaultBackgroundColor,
      "borderColor": Style.buttonDefaultBorderColor,
      "textColor": Style.buttonDefaultColor
    },
    ButtonType.primary: <String, Color>{
      "buttonColor": Style.buttonPrimaryBackgroundColor,
      "borderColor": Style.buttonPrimaryBorderColor,
      "textColor": Style.buttonPrimaryColor
    },
    ButtonType.info: <String, Color>{
      "buttonColor": Style.buttonInfoBackgroundColor,
      "borderColor": Style.buttonInfoBorderColor,
      "textColor": Style.buttonInfoColor
    },
    ButtonType.danger: <String, Color>{
      "buttonColor": Style.buttonDangerBackgroundColor,
      "borderColor": Style.buttonDangerBorderColor,
      "textColor": Style.buttonDangerColor
    },
    ButtonType.warning: <String, Color>{
      "buttonColor": Style.buttonWarningBackgroundColor,
      "borderColor": Style.buttonWarningBorderColor,
      "textColor": Style.buttonWarningColor
    },
  };

  Widget buildContent() {
    Color buttonColor;
    buttonColor = color is Gradient
        ? null
        : plain
            ? Style.buttonPlainBackgroundColor
            : (color ?? colors[type]["buttonColor"]);
    Color buttonTextColor = (textColor ??
        (plain
            ? (color ?? colors[type]["buttonColor"])
            : ((color != null) && type == ButtonType.normal
                ? Colors.white
                : colors[type]["textColor"])));

    return Container(
      width: width ?? null,
      height: height ?? sizes[size]["height"],
      padding: padding ?? sizes[size]["padding"],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: block ? MainAxisSize.max : MainAxisSize.min,
        children: <Widget>[
          loading
              ? SizedBox(
                  width: sizes[size]["fontSize"],
                  height: sizes[size]["fontSize"],
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(buttonTextColor),
                    backgroundColor: buttonColor,
                    strokeWidth: Style.borderWidthBase,
                  ),
                )
              : (icon != null ? icon : Container()),
          (loading || icon != null) && text != null
              ? SizedBox(width: Style.intervalSm)
              : Container(),
          text != null
              ? Text(text,
                  style: TextStyle(
                      color: buttonTextColor,
                      fontSize: sizes[size]["fontSize"]))
              : Container(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor;
    Color buttonColor;

    borderColor =
        color is Gradient ? null : (color ?? colors[type]["borderColor"]);
    buttonColor = color is Gradient
        ? null
        : plain
            ? Style.buttonPlainBackgroundColor
            : (color ?? colors[type]["buttonColor"]);
    return Opacity(
      opacity: disabled ? Style.buttonDisabledOpacity : 1.0,
      child: DecoratedBox(
          decoration: BoxDecoration(
              color: buttonColor ?? null,
              gradient: color is Gradient ? color : null,
              border: color is Gradient
                  ? null
                  : Border.all(
                      color: borderColor,
                      width: hairline
                          ? Style.buttonHairBorderWidth
                          : Style.buttonBorderWidth),
              borderRadius: borderRadius ??
                  (square
                      ? null
                      : BorderRadius.circular(round
                          ? Style.buttonRoundBorderRadius
                          : Style.buttonBorderRadius))),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
                focusColor: (disabled || loading)
                    ? Style.transparent
                    : Theme.of(context).focusColor,
                highlightColor: (disabled || loading)
                    ? Style.transparent
                    : Theme.of(context).highlightColor,
                hoverColor: (disabled || loading)
                    ? Style.transparent
                    : Theme.of(context).hoverColor,
                splashColor: (disabled || loading)
                    ? Style.transparent
                    : Theme.of(context).splashColor,
                borderRadius: borderRadius ??
                    (square
                        ? null
                        : BorderRadius.circular(round
                            ? Style.buttonRoundBorderRadius
                            : Style.buttonBorderRadius)),
                onTap: () {
                  if (!disabled && !loading && onClick != null) onClick();
                },
                child: buildContent()),
          )),
    );
  }
}
