import 'package:flutter/material.dart';

class ButtonWithStyle extends StatelessWidget {
  const ButtonWithStyle({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.black,
    this.foregroundColor = Colors.white,
    this.isCurcleShape = false,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
    this.borderRadius = 25.0,
    this.fontSize = 14.0,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.fontStyle = FontStyle.normal,
    this.textAlign = TextAlign.start,
    this.marginTop = 0.0,
    this.marginLeft = 0.0,
    this.marginRight = 0.0,
    this.marginBottom = 0.0,
    this.paddingTop = 0.0,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
    this.paddingBottom = 0.0,
  });

  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final bool isCurcleShape;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final double marginTop;
  final double marginLeft;
  final double marginRight;
  final double marginBottom;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final FontStyle fontStyle;
  final TextAlign textAlign;
  final double paddingTop;
  final double paddingLeft;
  final double paddingRight;
  final double paddingBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: marginTop,
          bottom: marginBottom,
          left: marginLeft,
          right: marginRight),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          textStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              color: color),
          shape: isCurcleShape
              ? const CircleBorder()
              : RoundedRectangleBorder(
                  side: BorderSide(
                    color: borderColor,
                    width: borderWidth,
                  ),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
          padding: EdgeInsets.only(
              top: paddingTop,
              bottom: paddingBottom,
              left: paddingLeft,
              right: paddingRight),
        ),
        child: Text(
          text,
          textAlign: textAlign,
        ),
      ),
    );
  }
}
