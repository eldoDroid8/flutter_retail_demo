import 'package:flutter/widgets.dart';

abstract class BaseGridViewStateless<T> extends StatelessWidget {
  final List<T> data;
  final int defaultSelectedIndex;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double childAspectRatio;

  BaseGridViewStateless({
    @required this.data,
    this.crossAxisCount: 2,
    this.crossAxisSpacing: 5.0,
    this.mainAxisSpacing: 2.0,
    this.defaultSelectedIndex = 0,
    this.childAspectRatio = 1
  });

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      itemCount: data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing, mainAxisSpacing: mainAxisSpacing,
      childAspectRatio: childAspectRatio),
      itemBuilder: (BuildContext context, int index){
        return buildBody(context, data[index]);
      },
    );
  }
  Widget buildBody(BuildContext context, T data);
}