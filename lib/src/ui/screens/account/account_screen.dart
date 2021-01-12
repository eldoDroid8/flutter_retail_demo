import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:retail_demo/src/model/account_data.dart';
import 'package:retail_demo/src/ui/widgets/base/base_list_view.dart';
import 'package:retail_demo/src/ui/widgets/svg_view.dart';
import 'package:retail_demo/src/utils/consts.dart';
import 'package:retail_demo/src/utils/screen_size_chart.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: SizeConfig.screenWidth,
        color: ColorConstants.veryLightGray,
        child: Column(
          children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Container(
                  width: SizeConfig.screenWidth,
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(alignment:Alignment.centerLeft,child: Text(StringConstants.LABEL_ACCOUNT_CAMEL,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: FontSize.fontSizeH2),)),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 15,
            child: Padding(
              padding: const  EdgeInsets.only(left: 10,top: 20,right: 10),
              child: new AccountScreenItemList(accountMenuList),
            ),
          ),
        ]
        )
    );
  }

  final List<AccountData> accountMenuList = [
    AccountData(
        type: AccountRowType.AccountInfo,
        mainTitle: "User Name",
        subTitle: "user@gmail.com",
        svgColor: Colors.orange,
        svgAssetPath: SvgAssetPath.EDIT),
    AccountData(
        type: AccountRowType.OrderInfo,
        mainTitle: StringConstants.LABEL_ORDERS,
        subTitle: StringConstants.LABEL_ORDERS_SUBTITLE,
        svgAssetPath: SvgAssetPath.DOWN_ARROW),
    AccountData(
        type: AccountRowType.AccountInfo,
        mainTitle: StringConstants.LABEL_MY_ACCOUNT,
        subTitle: StringConstants.LABEL_MY_ACCOUNT_SUBTITLE,
        svgAssetPath: SvgAssetPath.DOWN_ARROW),
    AccountData(
        type: AccountRowType.Help,
        mainTitle: StringConstants.LABEL_HELP,
        subTitle: StringConstants.LABEL_HELP_SUBTITLE,
        svgAssetPath: SvgAssetPath.DOWN_ARROW),
    AccountData(
        type: AccountRowType.Logout,
        mainTitle: StringConstants.LABEL_LOGOUT,
        subtitle: false,
        svgColor: Colors.orange,
        svgAssetPath: SvgAssetPath.TURN_OFF),
  ];
}

class AccountScreenItemList extends BaseListViewStateless<AccountData> {
  AccountScreenItemList(List<AccountData> accountData)
      : super(data: accountData, axis: Axis.vertical);
  @override
  Widget buildBody(BuildContext context, AccountData data) {
    Widget accountWidget = new AccountRowWidget(data);

      return accountWidget;
  }
}
class AccountRowWidget extends StatelessWidget {
  final AccountData data;

  AccountRowWidget(this.data);

  @override
  Widget build(BuildContext context) {
      return Container (
        height: SizeConfig.screenHeight * 0.12,
          child: Card(
            color: Colors.white,
            semanticContainer: true,
            child: Row(
              children: <Widget>[
                Expanded (
                  flex: 5,
                  child: Column (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text (data.mainTitle, style: TextStyle(fontWeight: FontWeight.bold, fontSize: FontSize.fontSizeH1),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Visibility(visible: data.subtitle,child: Text (data.subTitle == null ? "" : data.subTitle,
                          style: TextStyle(color:Colors.grey,fontWeight: FontWeight.normal, fontSize: FontSize.fontSizeB3),)),
                      ),
                    ],
                  ),
                ),
                Expanded (
                  flex: 1,
                  child: Column (
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new SvgAsset(width: 18, height: 18, imagePath: data.svgAssetPath, iconColor: data.svgColor,)
                    ]
                  )
                )
              ],
            ),
          ),
      );
  }

}