import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retail_demo/src/utils/screen_size_chart.dart';

class SingleImageTileView extends StatelessWidget {
  final String imagePath;
  SingleImageTileView({@required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: SizeConfig.screenHeight * 0.25,
        width: SizeConfig.screenWidth,
        child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.network(
              imagePath,
              fit: BoxFit.fill,
            ),
            elevation: 5,
            margin: EdgeInsets.all(5)));
  }
}
