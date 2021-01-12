import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retail_demo/src/ui/base/base_bloc.dart';
import 'package:rxdart/streams.dart';
import 'package:rxdart/transformers.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

abstract class BaseStatelessWidget extends StatelessWidget with BasicStateless {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      body: getBodyContent(context),
      floatingActionButton: fab(),
      bottomSheet: bottomSheet(context),
      bottomNavigationBar: bottomNavigation(),
    ));
  }

  Widget getBodyContent(BuildContext context);


  void hideStatusBar() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

  void showStatusBar() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }
}

mixin BasicStateless<widget extends StatelessWidget, Bloc extends BaseBloc> {
  Color backgroundColor;
  void setBackgroundColor({Color color: Colors.white}) {
    backgroundColor = color;
  }

  void createSnackBar(BuildContext context, Bloc bloc) {
    bloc.errorStream
        // this will preven multiple messages from showing up in a short interval of time
        .transform(new ThrottleStreamTransformer(
            (_) => TimerStream(true, const Duration(seconds: 2))))
        .listen((error) => showErrorSnackbar(error, context));
  }

  void showErrorSnackbar(String event, BuildContext context) {
    if (event != null) {
      final snackBar = SnackBar(
        content: Text(event),
      );

      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  Widget fab() => Container();
  Widget bottomNavigation() => BottomAppBar();
  FloatingActionButtonLocation getFloatingActionButtonLocation() =>
      FloatingActionButtonLocation.centerDocked;
  Widget bottomSheet(BuildContext context) => SolidBottomSheet();
}
