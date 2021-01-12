import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:retail_demo/src/utils/consts.dart';


class CornerRoundedButton extends StatefulWidget{
  final IconData icon;
  final Function onPress;
  final double iconSize;
  final Color fillColor;
  final Color iconColor;
  final double buttonWidth;
  final double buttonHeight;
  final RoundedCornerAlignment alignment;

  CornerRoundedButton({@required this.icon, @required this.onPress, @required this.iconSize, @required this.alignment,
    this.buttonWidth:40,this.buttonHeight:30, this.fillColor: ColorConstants.darkGray, this.iconColor: Colors.white});

  @override
  CornerRoundedButtonState createState() => new CornerRoundedButtonState();

}

class CornerRoundedButtonState extends State<CornerRoundedButton> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;


  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this, value: 0.1);
    animation = CurvedAnimation(parent: animationController, curve: Curves.bounceInOut);

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.buttonWidth,
      height: widget.buttonHeight,
      //constraints: BoxConstraints.tightFor(width: iconSize, height: iconSize),
      decoration: BoxDecoration(
          borderRadius: widget.alignment == RoundedCornerAlignment.RIGHT ?
          BorderRadius.only(topRight:  Radius.circular(5), bottomRight:Radius.circular(5)) : BorderRadius.only(topLeft:  Radius.circular(5), bottomLeft:Radius.circular(5)) ,
          border: Border.all(width: 3,color: widget.fillColor,)
      ),
      child: ScaleTransition(
        scale: animation,
        child: RawMaterialButton(
          highlightColor: Colors.purple,
          highlightElevation: 200.0,
          onPressed: () {
            animationController.forward();
            widget.onPress();
          },
          fillColor: widget.fillColor,
          child: Icon(
            widget.icon,
            color: Colors.white,
            size: widget.iconSize * 0.8,
          ),
        ),
      ),
    );
  }
  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }
}
enum RoundedCornerAlignment{LEFT,RIGHT}
//        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(iconSize*0.2)),