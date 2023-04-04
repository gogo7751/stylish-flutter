import 'package:flutter/material.dart';

class TextWithStyle extends StatelessWidget {
  const TextWithStyle(
      {super.key,
      required this.text,
      this.marginTop = 0.0,
      this.marginLeft = 0.0,
      this.marginRight = 0.0,
      this.marginBottom = 0.0,
      this.fontSize = 14.0,
      this.fontWeight = FontWeight.normal,
      this.color = Colors.black,
      this.fontStyle = FontStyle.normal,
      this.textAlign = TextAlign.start});

  final String text;
  final double marginTop;
  final double marginLeft;
  final double marginRight;
  final double marginBottom;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final FontStyle fontStyle;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            top: marginTop,
            bottom: marginBottom,
            left: marginLeft,
            right: marginRight),
        child: Text(
          text,
          textAlign: textAlign,
          style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              color: color),
        ));
  }
}
