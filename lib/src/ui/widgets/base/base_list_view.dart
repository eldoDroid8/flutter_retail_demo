import 'package:flutter/material.dart';

abstract class BaseListView<T> extends StatefulWidget {
  final Axis axis;
  final List<T> data;
  final int defaultSelectedIndex;

  BaseListView({
    @required this.data,
    this.axis = Axis.vertical,
    this.defaultSelectedIndex = 0,
  });
}

abstract class BaseListViewState<Page extends BaseListView, T>
    extends State<Page> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: widget.axis,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.data.length,
        itemBuilder: (BuildContext context, int index) {
          return buildBody(context, widget.data[index]);
        });
  }

  Widget buildBody(BuildContext context, T data);
}


abstract class BaseListViewStateless<T> extends StatelessWidget {
  final Axis axis;
  final List<T> data;
  final int defaultSelectedIndex;

  BaseListViewStateless({
    @required this.data,
    this.axis = Axis.vertical,
    this.defaultSelectedIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: axis,
        physics: const BouncingScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return buildBody(context, data[index]);
        });
  }
  Widget buildBody(BuildContext context, T data);
}


