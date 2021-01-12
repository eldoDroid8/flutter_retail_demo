import 'package:flutter/cupertino.dart';
import 'package:retail_demo/src/utils/consts.dart';
class AccountData {
  final AccountRowType type;
  final String mainTitle;
  final String subTitle;
  final String svgAssetPath;
  final bool subtitle;
  final Color svgColor;

  AccountData({@required this.type, @required this.mainTitle, this.subTitle, this.svgAssetPath: SvgAssetPath.DOWN_ARROW,
    this.svgColor,this.subtitle: true});
}

enum AccountRowType{UserInfo,OrderInfo,AccountInfo,Help,Logout}