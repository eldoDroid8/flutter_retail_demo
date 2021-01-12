import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:retail_demo/src/ui/base/base_stateless.dart';
import 'package:retail_demo/src/ui/screens/home/landing/widgets/offer_card.dart';
import 'package:retail_demo/src/ui/widgets/image_preview_gallery.dart';
import 'package:retail_demo/src/ui/widgets/stepcounter/step_Counter.dart';
import 'package:retail_demo/src/ui/widgets/svg_view.dart';
import 'package:retail_demo/src/utils/consts.dart';
import 'package:retail_demo/src/utils/screen_size_chart.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class ProductDetailScreen extends BaseStatelessWidget with BasicStateless {
  final SolidController bottomSheetControler = SolidController();
  @override
  Widget build(BuildContext context) {
    setBackgroundColor(color: ColorConstants.darkGray);
    hideStatusBar();
    return super.build(context);
  }
  @override
  Widget getBodyContent(BuildContext context) {
      return Container(
        color: ColorConstants.darkGray,
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20,top: 20),
                          child: new SvgAsset(width: 18, height: 18, imagePath:SvgAssetPath.HEART),
                        )
                    ],
                ),
              ),
            ),
              Positioned(
                top: SizeConfig.screenHeight*0.08,
                child: Container (
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight*0.6,
                  child: new ImagePageViewGalley(cardData: cardsArr),
                )
            ),
          ],
        ),
      );
  }

  @override
  Widget bottomSheet(BuildContext context) {
    return SolidBottomSheet(
      maxHeight: 200,
      controller: bottomSheetControler,
      canUserSwipe: true,
      draggableBody: true,
      headerBar: bottomSheetHeader,
      body: Container(
        color: Colors.white,
        height: 10,
        child: Container(
          child: Center(
            child: Text(
              "Hello! I'm a bottom sheet :D",
            ),
          ),
            decoration: new BoxDecoration(
                color: Colors.green,
                borderRadius: new BorderRadius.only(
                    topLeft:  const  Radius.circular(40.0),
                    topRight: const  Radius.circular(40.0))
            )
        ),
      ),
    );
  }

  Widget bottomSheetHeader = Container(
      height: SizeConfig.screenHeight*0.12,
      child: Column(
        children: <Widget>[
          /**divider*/
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: Colors.grey,
                  thickness: 2,
                  indent: SizeConfig.screenWidth*0.4,
                  endIndent: SizeConfig.screenWidth*0.4,
                ),
              )
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 5,left: 20),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text("Mysore Onion", style: TextStyle(fontWeight: FontWeight.bold),)),
          ),
          Container(padding: EdgeInsets.only(top: 10,left: 20),
            child: Row(
                children: <Widget> [
                  Expanded(
                    child: Text("Dark Red",
                      style: TextStyle(fontSize: FontSize.fontSizeB3, color: Colors.red),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 35),
                    child: Text("500 Gms",
                      style: TextStyle(fontSize: FontSize.fontSizeB3, color: Colors.grey),),
                  )
                ]
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20,top: 10),
            child: Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("RS.30", style: TextStyle(fontWeight: FontWeight.bold),),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("RS.45", style: TextStyle(fontSize: FontSize.fontSizeB3, color: Colors.grey,decoration: TextDecoration.lineThrough),),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(right: 20),
                    child:  StepCounter(lowerLimit: 0,
                      upperLimit: 20,
                      stepValue: 1,
                      iconSize: 22.0,
                      value: 0,
                      roundCornerButtonWidth: 30,
                      roundCornerButtonHeight: 20,)
                )
              ],
            ),
          )
        ],
      ),
    decoration: new BoxDecoration(
        color: Colors.grey,
        borderRadius: new BorderRadius.only(
            topLeft:  const  Radius.circular(10.0),
            topRight: const  Radius.circular(10.0))
    ),
  );

  final List<MusicCardModel> cardsArr = [
    MusicCardModel(
        url: "https://placeimg.com/640/480/any",
        title: "Shape of you",
        subtitle: "Ed Sheeran"),
    MusicCardModel(
        url: "https://placeimg.com/640/480/any",
        title: "Perfect",
        subtitle: "Ed Sheeran"),
    MusicCardModel(
        url: "https://placeimg.com/640/480/any",
        title: "Castle on the Hill",
        subtitle: "Ed Sheeran"),
    MusicCardModel(
        url: "https://placeimg.com/640/480/any",
        title: "Galway girl",
        subtitle: "Ed Sheeran"),
    MusicCardModel(
        url: "https://placeimg.com/640/480/any",
        title: "All of the stars",
        subtitle: "Ed Sheeran"),
    MusicCardModel(
        url: "https://placeimg.com/640/480/any",
        title: "How Would You Feel",
        subtitle: "Ed Sheeran"),
    MusicCardModel(
        url: "https://placeimg.com/640/480/any",
        title: "Thinking out loud",
        subtitle: "Ed Sheeran"),
  ];
}