import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:retail_demo/src/ui/screens/home/landing/widgets/offer_card.dart';
import 'package:retail_demo/src/ui/widgets/base/base_grid_view.dart';
import 'package:retail_demo/src/ui/widgets/stepcounter/step_Counter.dart';
import 'package:retail_demo/src/ui/widgets/svg_view.dart';
import 'package:retail_demo/src/utils/consts.dart';
import 'package:retail_demo/src/utils/screen_size_chart.dart';

class ProductCardList extends BaseGridViewStateless {
  ProductCardList(List<MusicCardModel> cardData, double aspectRatio)
      : super(data: cardData, childAspectRatio: aspectRatio);

  @override
  Widget buildBody(BuildContext context, data) {
    return new ProductCard(cardData: data);
  }
}


class ProductCard extends StatelessWidget {
  //final AiCardData aiCardData;
  final MusicCardModel cardData;
  ProductCard({@required this.cardData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.white,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Stack(
                      children: <Widget>[
                        new SvgAsset(width: 36, height: 36, imagePath: SvgAssetPath.OFFER_BADGE,iconColor: ColorConstants.buttonBgColor,),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Center(child: Text("20%\nOFF", style: TextStyle(color: Colors.white),)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 5),
                  width: SizeConfig.screenWidth * 0.35,
                  height: SizeConfig.screenHeight * 0.15,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(cardData.url),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  )),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,left: 10),
                  child: Text(
                    cardData.title,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10),
                  child: Text(cardData.subtitle,
                      style: new TextStyle(color: Colors.red)),
                ),
              ),

              Container(padding: EdgeInsets.only(top: 10,left: 10),
                child: Row(
                    children: <Widget> [
                      Expanded(
                        child: Text(cardData.subtitle,
                          style: TextStyle(fontSize: FontSize.fontSizeB3),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text("500 Gms",
                          style: TextStyle(fontSize: FontSize.fontSizeB3, color: Colors.grey),),
                      )
                    ]
                ),
              ),

              Container(
                padding: EdgeInsets.only(left: 10,top: 10),
                child: Row (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text("RS.45", style: TextStyle(fontSize: FontSize.fontSizeB3, color: Colors.grey,decoration: TextDecoration.lineThrough),),
                    ),
                    Container(
                        padding: EdgeInsets.only(right: 10),
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
        ),
      ),
    );
  }
}