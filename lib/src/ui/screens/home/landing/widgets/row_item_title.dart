import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retail_demo/src/ui/widgets/svg_view.dart';
import 'package:retail_demo/src/utils/consts.dart';
import 'package:retail_demo/src/utils/screen_size_chart.dart';

class RowItemTitle extends StatelessWidget {
  final String assetImagePath;
  final String rowTitleLabel;
  final String rowEndAssetImagePath;
  final bool showIconOnRowEdge;
  final bool showIconOnRowStart;
  final double marginTop;
  final VoidCallback rowEndIconPressed;
  RowItemTitle(
      {this.assetImagePath, this.rowTitleLabel, this.showIconOnRowEdge,
        this.showIconOnRowStart: true,this.rowEndAssetImagePath: SvgAssetPath.INDENT_ALL,
      this.rowEndIconPressed, this.marginTop});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.screenHeight * 0.05,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: showIconOnRowStart,
                child: new SvgAsset(width: 24, height: 24, imagePath: assetImagePath)),
            Container(
              margin: const EdgeInsets.only(left: 5,top: 2),
              child: Text(
                rowTitleLabel,
                textAlign: TextAlign.center,
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: FontSize.fontSizeH1),
              ),
            ),
            Visibility(
              visible: showIconOnRowEdge,
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: FractionallySizedBox(
                      widthFactor: 0.1,
                      heightFactor: 0.6,
                      child: InkWell(
                         onTap: () => {
                           null != rowEndIconPressed? rowEndIconPressed() : {print("tapped")
                       }},
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(5))),
                          child: new SvgAsset(
                              width: 18,
                              height: 18,
                              imagePath: rowEndAssetImagePath),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
