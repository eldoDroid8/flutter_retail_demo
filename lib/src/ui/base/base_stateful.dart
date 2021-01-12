import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/streams.dart';
import 'package:rxdart/transformers.dart';
import 'base_bloc.dart';

abstract class BasePage<Bloc extends BaseBloc> extends StatefulWidget {
  final Bloc bloc;
  BasePage({Key key, this.bloc}) : super(key: key);
}

abstract class BaseState<Page extends BasePage> extends State<Page> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  String screenName();
}

mixin BasicPage<Page extends BasePage> on BaseState<Page> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: SafeArea(
          child: Scaffold(
           appBar: getAppBar(),
            body: Container(
                child: body(),
              ),
              floatingActionButtonLocation: getFloatingActionButtonLocation(),
              floatingActionButton: fab(),
              bottomNavigationBar: bottomNavigation())),
    );
  }
  Future<bool> onBackPressed() async {
    return false;
  }
  Widget getAppBar();
  Widget body();
  Widget fab() => Container();
  Widget bottomNavigation() => BottomAppBar();
  FloatingActionButtonLocation getFloatingActionButtonLocation() =>
      FloatingActionButtonLocation.centerDocked;
}

mixin ErrorHandlingSateful<Page extends BasePage> on BaseState<Page> {
  @override
  void initState() {
    super.initState();
    widget.bloc.errorStream
        // this will preven multiple messages from showing up in a short interval of time
        .transform(new ThrottleStreamTransformer(
            (_) => TimerStream(true, const Duration(seconds: 2))))
        .listen((error) => showErrorSnackbar(error, scaffoldKey.currentState));
  }

  void showErrorSnackbar(String event, ScaffoldState context) {
    if (event != null) {
      context.showSnackBar(new SnackBar(
        content: new Text(event),
      ));
    }
  }
}
