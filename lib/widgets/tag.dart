import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/theme/style.dart';

enum TagSize { normal, medium, large }

enum TagType { normal, primary, success, danger, warning }

class Tag extends StatefulWidget {
  // size
  final TagType type;
  // size
  final TagSize size;
  // Text in Tag
  final String text;
  // Whether it is a hollow style
  final bool plain;
  // Whether it is rounded
  final bool round;
  // Whether it is a mark style
  final bool mark;
  // Tag color
  final Color color;
  // Text color, priority over color attribute
  final Color textColor;
  // Whether the tag can be closed
  final Function() onClose;

  Tag({
    Key key,
    this.type: TagType.normal,
    this.size: TagSize.normal,
    this.text: "",
    this.plain: false,
    this.round: false,
    this.mark: false,
    this.color,
    this.textColor,
    this.onClose,
  })  : assert(size != null, "size must be default, medium, or large"),
        assert(type != null,
            "type must be default, primary, success, danger or warning"),
        super(key: key);

  @override
  _Tag createState() => _Tag();
}

class _Tag extends State<Tag> {
  bool isShow = true;

  Map<TagSize, dynamic> sizes = {
    TagSize.normal: <String, double>{"fontSize": Style.tagFontSize},
    TagSize.medium: <String, double>{"fontSize": Style.tagMediumFontSize},
    TagSize.large: <String, double>{"fontSize": Style.tagLargeFontSize}
  };

  Map<TagType, dynamic> colors = {
    TagType.normal: <String, Color>{"color": Style.tagDefaultColor},
    TagType.danger: <String, Color>{"color": Style.tagDangerColor},
    TagType.primary: <String, Color>{"color": Style.tagPrimaryColor},
    TagType.success: <String, Color>{"color": Style.tagSuccessColor},
    TagType.warning: <String, Color>{"color": Style.tagWarningColor},
  };

  void close() {
    widget.onClose();
    setState(() {
      isShow = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor = widget.color ?? colors[widget.type]['color'];
    Color bageColor = widget.plain
        ? Style.tagPlainBackgroundColor
        : widget.color ?? colors[widget.type]['color'];
    Color textColor = widget.textColor ??
        (widget.plain
            ? widget.color ?? colors[widget.type]['color']
            : Style.tagTextColor);
    return Visibility(
      visible: isShow,
      child: Container(
        padding: Style.tagPadding,
        margin: Style.tagMargin,
        decoration: BoxDecoration(
          color: bageColor,
          border: Border.all(color: borderColor, width: Style.borderWidthBase),
          borderRadius: widget.mark
              ? BorderRadius.horizontal(
                  left: Radius.circular(Style.tagBorderRadius),
                  right: Radius.circular(Style.tagRoundBorderRadius))
              : BorderRadius.circular(widget.round
                  ? Style.tagRoundBorderRadius
                  : Style.tagBorderRadius),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(widget.text,
                style: TextStyle(
                  color: textColor,
                  fontSize: sizes[widget.size]['fontSize'],
                )),
            widget.onClose != null
                ? GestureDetector(
                    child: Icon(
                      Icons.close,
                      color: textColor,
                      size: sizes[widget.size]['fontSize'],
                    ),
                    //TODO:增加动画效果
                    onTap: () => close(),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
