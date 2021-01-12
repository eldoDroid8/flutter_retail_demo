import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Label {
  String label;
  LabelComponentType labelComponentType;
  final TextStyle textStyle;
  Label({this.label, this.labelComponentType, this.textStyle});
}

enum LabelComponentType { WIDGET, EMPTY_SPACE }

class EditFieldData {
  StreamBuilder<String> streamBuilder;
  String label;
  EditFieldData({@required this.streamBuilder});
}

class UserEntrySizedBoxParams {
  final double topMargin;
  final double spaceBetweenLogoAndLabel;
  final double spaceBetweenLabelAndEditField;

  UserEntrySizedBoxParams(
      {this.topMargin,
      this.spaceBetweenLogoAndLabel,
      this.spaceBetweenLabelAndEditField});
}
