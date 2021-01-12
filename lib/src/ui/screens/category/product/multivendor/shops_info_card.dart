import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retail_demo/src/ui/screens/home/landing/widgets/offer_card.dart';
import 'package:retail_demo/src/ui/widgets/edit_field.dart';
import 'package:retail_demo/src/ui/widgets/svg_view.dart';
import 'package:retail_demo/src/utils/consts.dart';
import 'package:retail_demo/src/utils/screen_size_chart.dart';

class ShopsInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 5),
        height: SizeConfig.screenHeight * 0.3,
        child: Card(
          color: Colors.white,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          width: SizeConfig.screenWidth * 0.3,
                          height: SizeConfig.screenHeight * 0.17,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://placeimg.com/640/480/any"),
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          )
                      )
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 8,
                              child: Padding(
                                padding: const EdgeInsets.only(top:15, left: 15),
                                child: Text(
                                    musicCardModel.title
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(top:10),
                                  child: new SvgAsset(width: 24, height: 24, imagePath: SvgAssetPath.HEART),
                                ))
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only( left: 15),
                          child: Row(
                            children: <Widget>[
                              new SvgAsset(width: 18, height: 18, imagePath: SvgAssetPath.CATEGORY,iconColor: Colors.red,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  musicCardModel.title,
                                  style: TextStyle(color: Colors.red),),
                              ),

                            ],
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.only( left: 15),
                          child: Row(
                            children: <Widget>[
                              new SvgAsset(width: 18, height: 18, imagePath: SvgAssetPath.LOCATION
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    musicCardModel.title),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
             Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20,bottom: 10, left: 10),
                    height: SizeConfig.screenHeight*0.05,
                    width:  SizeConfig.screenWidth*0.9,
                    child: Stack(
                      alignment: AlignmentDirectional.topEnd,
                      fit: StackFit.expand,
                      children: [
                        new EditField(
                          StringConstants.LABEL_EDIT_FIELD_SEARCH_PRODUCTS,
                          StringConstants.LABEL_EDIT_FIELD_SEARCH_PRODUCTS,
                          textInputType: TextInputType.text,
                        ),
                        //new SvgAsset(width: 6, height: 6, imagePath: SvgAssetPath.SEARCH)
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        )
    );
  }
 MusicCardModel  musicCardModel = MusicCardModel(
  url: "https://i.ibb.co/7K1kdx1/grocery3res300.jpg",
  title: "My Shoppie",
  subtitle: "Xyz");
}