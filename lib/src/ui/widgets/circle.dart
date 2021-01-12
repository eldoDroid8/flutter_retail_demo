import 'package:flutter/cupertino.dart';

class Circle extends StatelessWidget {
  final double height;
  final double width;
  final Color fillColor;

  Circle({this.height, this.width, this.fillColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: fillColor),
    );
  }

}