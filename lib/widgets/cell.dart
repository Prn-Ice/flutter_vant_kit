import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/theme/style.dart';

enum CellSize { normal, large }

class Cell extends StatelessWidget {
  // Left heading
  final String title;
  // Descriptive information below the title
  final String label;
  // Cell size
  final CellSize size;
  // Content on the right
  final String value;
  // Left icon
  final IconData icon;
  // Whether to display the form must be filled with asterisks
  final bool require;
  // Clickable
  final bool clickable;
  // Whether to show the right arrow and enable click feedback
  final bool isLink;
  // Arrow direction
  final String arrowDirection;
  // Custom header content
  final Widget customTitle;
  // Description below custom title
  final Widget customLabel;
  // Customize the content on the right
  final Widget customRight;
  // Triggered when a cell is clicked
  final Function() onClick;

  Cell({
    Key key,
    this.value,
    this.label,
    this.title,
    this.icon,
    this.size: CellSize.normal,
    this.require: false,
    this.clickable: false,
    this.isLink: false,
    this.onClick,
    this.arrowDirection: "right",
    this.customTitle,
    this.customLabel,
    this.customRight,
  })  : assert(size != null, "size must be normal or large"),
        assert(["left", "right", "up", "down"].indexOf(arrowDirection) > -1,
            "arrowDirection must be left, right, up or down"),
        super(key: key);

  IconData getLinkIcon() {
    switch (arrowDirection) {
      case "left":
        return Icons.chevron_left;
        break;
      case "up":
        return Icons.expand_less;
        break;
      case "down":
        return Icons.expand_more;
        break;
      default:
        return Icons.chevron_right;
    }
  }

  final Map<CellSize, dynamic> sizes = {
    CellSize.normal: <String, dynamic>{
      "verticalPadding": Style.cellVerticalPadding,
      "titleFontSize": Style.cellFontSize,
      "labelFontSize": Style.cellLabelFontSize,
    },
    CellSize.large: <String, dynamic>{
      "verticalPadding": Style.cellLargeVerticalPadding,
      "titleFontSize": Style.cellLargeTitleFontSize,
      "labelFontSize": Style.cellLargeLabelFontSize,
    }
  };

  Widget buildLeft() {
    return Row(
      children: <Widget>[
        require
            ? Text("*",
                style: TextStyle(
                  fontSize: sizes[size]['titleFontSize'],
                  color: Style.cellRequiredColor,
                ))
            : Container(),
        icon != null
            ? Icon(icon, size: Style.cellIconSize, color: Style.cellTextColor)
            : Container(),
        icon != null ? SizedBox(width: Style.intervalSm) : Container(),
        title != null
            ? Text(title,
                style: TextStyle(
                  fontSize: sizes[size]['titleFontSize'],
                ))
            : Container(),
        customTitle ?? Container(),
      ],
    );
  }

  Widget buildRight() {
    return Row(
      children: <Widget>[
        value != null
            ? Text(value,
                style: TextStyle(
                    fontSize: Style.cellFontSize,
                    color: (title != null || customTitle != null)
                        ? Style.cellValueColor
                        : Style.cellTextColor))
            : Container(),
        isLink
            ? Icon(getLinkIcon(),
                color: Style.cellRightIconColor, size: Style.cellIconSize)
            : Container(),
        customRight != null ? customRight : Container(),
      ],
    );
  }

  Widget buildBottom() {
    return customLabel ??
        (label != null
            ? Text(label,
                style: TextStyle(
                    fontSize: sizes[size]['labelFontSize'],
                    color: Style.cellLabelColor))
            : Container());
  }

  Widget buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Row(
          mainAxisAlignment: (title != null || customTitle != null)
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.start,
          children: <Widget>[buildLeft(), buildRight()],
        ),
        SizedBox(height: Style.intervalSm),
        buildBottom()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ((clickable || isLink) && onClick != null)
        ? DecoratedBox(
            decoration: BoxDecoration(color: Style.cellBackgroundColor),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: sizes[size]["verticalPadding"],
                        horizontal: Style.cellHorizontalPadding),
                    child: buildContent()),
                onTap: () {
                  onClick();
                },
              ),
            ),
          )
        : Container(
            padding: EdgeInsets.symmetric(
                vertical: sizes[size]["verticalPadding"],
                horizontal: Style.cellHorizontalPadding),
            color: Style.cellBackgroundColor,
            child: buildContent());
  }
}
