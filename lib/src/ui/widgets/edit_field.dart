import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retail_demo/src/ui/widgets/svg_view.dart';
import 'package:retail_demo/src/utils/consts.dart';

// ignore: must_be_immutable
class EditField extends StatelessWidget {
  final String label;
  final String hint;
  final String errorLabel;
  final bool hasSuffixIcon;
  final String suffixIconPath;
  TextInputType textInputType;
  InputBorder inputBorder;
  Function(String) dataStream;
  EditField(this.label, this.hint,
      {this.errorLabel,
      this.textInputType,
      this.dataStream,
      this.inputBorder: TextFieldStyle.border,
      this.hasSuffixIcon: false,
      this.suffixIconPath});
  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: textInputType,
        onChanged: dataStream,
        decoration: InputDecoration(
          labelText: label,
          errorText: errorLabel,
          border: inputBorder,
          suffixIcon: Container(
              height: 8,
              width: 8,
              child:
              new SvgAsset(width: 3, height: 3, imagePath: SvgAssetPath.SEARCH)
          ))
        );
  }
}
