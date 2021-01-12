import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:retail_demo/src/utils/consts.dart';
import 'package:retail_demo/src/utils/screen_size_chart.dart';

import 'button_corner_rounded.dart';

class StepCounter extends StatefulWidget {
  StepCounter({
    @required this.lowerLimit,
    @required this.upperLimit,
    @required this.stepValue,
    @required this.iconSize,
    @required this.value,
    this.backgroundColor: ColorConstants.darkGray,
    this.roundCornerButtonWidth:40,
    this.roundCornerButtonHeight:30,
  });

  final double roundCornerButtonHeight;
  final double roundCornerButtonWidth;
  final int lowerLimit;
  final int upperLimit;
  final int stepValue;
  final double iconSize;
  final Color backgroundColor;
  int value;

  @override
  StepCounterState createState() => StepCounterState();
}

class StepCounterState extends State<StepCounter> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenWidth*0.05,
      child: Column(
        children: [
          Row(
            children: [
              CornerRoundedButton(
                buttonWidth: widget.roundCornerButtonWidth,
                buttonHeight: widget.roundCornerButtonHeight,
                icon: Icons.remove,
                iconSize: widget.iconSize,
                alignment: RoundedCornerAlignment.LEFT,
                onPress: () {
                  setState(() {
                    widget.value =
                    widget.value == widget.lowerLimit ? widget.lowerLimit : widget.value -= widget.stepValue;
                  });
                },
              ),
              Container(
                color: ColorConstants.darkGray,
                width: widget.iconSize,
                height: widget.roundCornerButtonHeight,
                child: Center(
                  child: Text(
                    '${widget.value}',
                    style: TextStyle(
                      fontSize: widget.iconSize * 0.8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              CornerRoundedButton(
                buttonWidth: widget.roundCornerButtonWidth,
                buttonHeight: widget.roundCornerButtonHeight,
                icon: Icons.add,
                iconSize: widget.iconSize,
                alignment: RoundedCornerAlignment.RIGHT,
                onPress: () {
                  setState(() {
                    widget.value =
                    widget.value == widget.upperLimit ? widget.upperLimit : widget.value += widget.stepValue;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}