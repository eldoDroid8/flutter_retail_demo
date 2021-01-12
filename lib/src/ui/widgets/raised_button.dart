import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retail_demo/src/utils/consts.dart';

import '../../utils/consts.dart';
import '../../utils/consts.dart';

// ignore: must_be_immutable
class M2HomeRaisedButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback callback;
  final ShapeBorder buttonShape;
  final FontWeight fontWeight;
  final double fontSize;
  Function test;
  AsyncSnapshot snapshot;
  M2HomeRaisedButton(this.buttonText, this.buttonColor, this.callback,
      {this.snapshot,
      this.textColor: Colors.white,
      this.buttonShape: AppButtonStyles.buttonBorderWithRoundRect,
      this.fontWeight: FontWeight.normal,
      this.fontSize: FontSize.fontSizeH4});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text(
          buttonText,
          style: TextStyle(
              color: textColor, fontSize: fontSize, fontWeight: fontWeight),
        ),
        color: buttonColor,
        shape: buttonShape,
        onPressed: snapshot?.hasData == false ? null : callback);
  }
}
