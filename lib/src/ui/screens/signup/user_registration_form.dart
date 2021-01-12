import 'package:flutter/widgets.dart';
import 'package:retail_demo/src/blocs/login/login_blocs.dart';
import 'package:retail_demo/src/model/widget_generator.dart';
import 'package:retail_demo/src/ui/widgets/base/base_user_entry_screen.dart';
import 'package:retail_demo/src/ui/widgets/edit_field.dart';
import 'package:retail_demo/src/utils/consts.dart';

// ignore: must_be_immutable
class UserRegistrationForm extends BaseUserEntryScreen {
  final LoginBlocs loginBloc = LoginBlocs();

  @override
  Widget build(BuildContext context) {
    setBackgroundColor(color: ColorConstants.veryLightGray);
    createSnackBar(context, loginBloc);
    userEntryLogoWidth = 100;
    userEntryLogoHeight = 100;
    hideStatusBar();
    return super.build(context);
  }

  @override
  List<EditFieldData> getEditFieldData() {
    List<EditFieldData> editFieldDataInfo = new List();
    StreamBuilder<String> emailAddress = StreamBuilder<String>(
        stream: loginBloc.emailStream,
        builder: (context, snapshot) {
          return new EditField(
            StringConstants.LABEL_EDIT_FIELD_EMAIL_ADDRESS,
            StringConstants.LABEL_EDIT_FIELD_EMAIL_ADDRESS,
            dataStream: loginBloc.emailSink,
            errorLabel: snapshot.error,
            textInputType: TextInputType.number,
          );
        });

    StreamBuilder<String> name = StreamBuilder<String>(
        stream: loginBloc.emailStream,
        builder: (context, snapshot) {
          return new EditField(
            StringConstants.LABEL_EDIT_FIELD_NAME,
            StringConstants.LABEL_EDIT_FIELD_NAME,
            dataStream: loginBloc.emailSink,
            errorLabel: snapshot.error,
            textInputType: TextInputType.number,
          );
        });

    StreamBuilder<String> password = StreamBuilder<String>(
        stream: loginBloc.emailStream,
        builder: (context, snapshot) {
          return new EditField(
            StringConstants.LABEL_EDIT_FIELD_PASSWORD,
            StringConstants.LABEL_EDIT_FIELD_PASSWORD,
            dataStream: loginBloc.emailSink,
            errorLabel: snapshot.error,
            textInputType: TextInputType.number,
          );
        });

    EditFieldData data1 = new EditFieldData(streamBuilder: emailAddress);
    EditFieldData data2 = new EditFieldData(streamBuilder: name);
    EditFieldData data3 = new EditFieldData(streamBuilder: password);
    editFieldDataInfo.add(data1);
    editFieldDataInfo.add(data2);
    editFieldDataInfo.add(data3);
    return editFieldDataInfo;
  }

  @override
  UserEntrySizedBoxParams getUserEntrySizedBoxParams() {
    return new UserEntrySizedBoxParams(
        topMargin: 50,
        spaceBetweenLogoAndLabel: 50,
        spaceBetweenLabelAndEditField: 10);
  }

  @override
  List<Label> getLabelList() {
    TextStyle style1 =
        new TextStyle(fontWeight: FontWeight.normal, fontSize: 16);
    List<Label> labelList = new List();
    Label l1 = new Label(
        label: "9495204292",
        labelComponentType: LabelComponentType.WIDGET,
        textStyle: style1);
    labelList.add(l1);
    return labelList;
  }
}
