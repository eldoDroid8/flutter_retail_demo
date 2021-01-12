import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class SvgAsset extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  final Color iconColor;
  SvgAsset(
      {@required this.width,
      @required this.height,
      @required this.imagePath,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imagePath,
      semanticsLabel: 'M2HomeLogo',
      width: width,
      height: height,
      color: iconColor,
    );
  }
}
