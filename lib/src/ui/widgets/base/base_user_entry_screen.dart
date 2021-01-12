import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retail_demo/src/model/widget_generator.dart';
import 'package:retail_demo/src/ui/base/base_stateless.dart';
import '../raised_button.dart';
import '../../../utils/consts.dart';
import '../../../blocs/login/login_blocs.dart';
import '../svg_view.dart';

final LoginBlocs loginBloc = LoginBlocs();

// ignore: must_be_immutable
abstract class BaseUserEntryScreen extends BaseStatelessWidget
    with BasicStateless {
  final Color backgroundColor;
  final bool createSnackBarFlag;
  final bool hideStatusBarFlag;
  double userEntryLogoWidth;
  double userEntryLogoHeight;

  void setUSerEntryLogoDimensions(double width, double height) {
    this.userEntryLogoWidth = width;
    this.userEntryLogoHeight = height;
  }

  BaseUserEntryScreen(
      {this.backgroundColor: ColorConstants.veryLightGray,
      this.createSnackBarFlag: false,
      this.hideStatusBarFlag: true});

  // String getMainTitleLabel();
  // String getSubTitleLabel();
  List<Label> getLabelList();
  UserEntrySizedBoxParams getUserEntrySizedBoxParams();
  List<EditFieldData> getEditFieldData();
  UserEntrySizedBoxParams params;
  @override
  Widget build(BuildContext context) {
    setBackgroundColor(color: backgroundColor);
    if (createSnackBarFlag) {
      createSnackBar(context, loginBloc);
    }
    if (hideStatusBarFlag) {
      hideStatusBar();
    }
    params = getUserEntrySizedBoxParams();
    return super.build(context);
  }

  @override
  Widget getBodyContent(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Row(
        children: <Widget>[
          Flexible(
              child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: params.topMargin,
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                new SvgAsset(
                    width: userEntryLogoWidth,
                    height: userEntryLogoHeight,
                    imagePath: 'assets/images/indent-all.svg'),
              ]),
              Container(
                margin: EdgeInsets.only(top: params.spaceBetweenLogoAndLabel),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[new UserEntryLabelSection(getLabelList())],
              ),
              SizedBox(
                height: params.spaceBetweenLabelAndEditField,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new InputWidgetContainer(
                      editFieldDataList: getEditFieldData()),
                ],
              )
            ],
          ))
        ],
      )),
    );
  }
}

class UserEntryLabelSection extends StatelessWidget {
  final List<Label> labelList;

  UserEntryLabelSection(this.labelList);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[new LabelGenerator(label: labelList)],
      ),
    );
  }
}

class LabelGenerator extends StatelessWidget {
  final List<Label> label;
  LabelGenerator({@required this.label});

  @override
  Widget build(BuildContext context) {
    var list = new List<int>.generate(label.length, (i) => i + 1);
    return Container(
        child: Column(
      children: List.generate(list.length, (index) {
        return Container(
          margin: EdgeInsets.only(left: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (label[index].labelComponentType ==
                  LabelComponentType.WIDGET) ...[
                SizedBox(
                    height: 25,
                    child: Text(
                      label[index].label,
                      style: label[index].textStyle,
                    ))
              ] else if (label[index].labelComponentType ==
                  LabelComponentType.EMPTY_SPACE) ...[
                SizedBox(
                  height: 2,
                ),
              ],
            ],
          ),
        );
      }),
    ));
  }
}

class InputWidgetContainer extends StatelessWidget {
  final List<EditFieldData> editFieldDataList;
  InputWidgetContainer({@required this.editFieldDataList});
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new FormFieldGenerator(editFieldDataList: editFieldDataList),
        SizedBox(
          height: 5,
        ),
        Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: SizedBox(
                  height: 65,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: submitButton,
                  ),
                )),
              ],
            ))
      ],
    ));
  }
}

class FormFieldGenerator extends StatelessWidget {
  final List<EditFieldData> editFieldDataList;
  FormFieldGenerator({@required this.editFieldDataList});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: List.generate(editFieldDataList.length, (index) {
        double marginTop = index == 0 ? 0 : 5;
        return Container(
          margin: EdgeInsets.only(left: 10, top: marginTop, right: 10),
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  height: 65,
                  child: editFieldDataList[index].streamBuilder,
                ),
              )
            ],
          ),
        );
      }),
    ));
  }
}

Widget submitButton = M2HomeRaisedButton(
    StringConstants.LABEL_SEND_OTP, ColorConstants.buttonBgColor, () => {null},
    fontWeight: FontWeight.bold);
