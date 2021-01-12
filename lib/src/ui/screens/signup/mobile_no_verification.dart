import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retail_demo/src/model/widget_generator.dart';
import 'package:retail_demo/src/ui/widgets/base/base_user_entry_screen.dart';
import '../../../utils/consts.dart';
import '../../widgets/edit_field.dart';
import '../../../blocs/login/login_blocs.dart';

final LoginBlocs loginBloc = LoginBlocs();

// ignore: must_be_immutable
class MobileNoVerificationScreen extends BaseUserEntryScreen {
  @override
  Widget build(BuildContext context) {
    setBackgroundColor(color: ColorConstants.veryLightGray);
    createSnackBar(context, loginBloc);
    userEntryLogoWidth = 200;
    userEntryLogoHeight = 200;
    hideStatusBar();
    return super.build(context);
  }

  @override
  String getMainTitleLabel() {
    return StringConstants.LABEL_COMPLETE_VERIFICATION;
  }

  @override
  String getSubTitleLabel() {
    return StringConstants.LABEL_ENTER_OTP;
  }

  @override
  List<EditFieldData> getEditFieldData() {
    List<EditFieldData> editFieldDataInfo = new List();
    StreamBuilder<String> mobileNo = StreamBuilder<String>(
        stream: loginBloc.emailStream,
        builder: (context, snapshot) {
          return new EditField(
            StringConstants.LABEL_EDIT_FIELD_ENTER_OTP,
            StringConstants.LABEL_EDIT_FIELD_ENTER_OTP,
            dataStream: loginBloc.emailSink,
            errorLabel: snapshot.error,
            textInputType: TextInputType.number,
          );
        });
    EditFieldData data1 = new EditFieldData(streamBuilder: mobileNo);
    editFieldDataInfo.add(data1);
    return editFieldDataInfo;
  }

  @override
  UserEntrySizedBoxParams getUserEntrySizedBoxParams() {
    return new UserEntrySizedBoxParams(
        topMargin: 100,
        spaceBetweenLogoAndLabel: 50,
        spaceBetweenLabelAndEditField: 30);
  }

  @override
  List<Label> getLabelList() {
    TextStyle style1 = new TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
    TextStyle style2 = new TextStyle(color: ColorConstants.darkGray);
    List<Label> labelList = new List();
    Label l1 = new Label(
        label: StringConstants.LABEL_COMPLETE_VERIFICATION,
        labelComponentType: LabelComponentType.WIDGET,
        textStyle: style1);
    labelList.add(l1);

    Label l2 = new Label(labelComponentType: LabelComponentType.EMPTY_SPACE);
    labelList.add(l2);

    Label l3 = new Label(
        label: StringConstants.LABEL_ENTER_OTP,
        labelComponentType: LabelComponentType.WIDGET,
        textStyle: style2);
    labelList.add(l3);
    return labelList;
  }
}
