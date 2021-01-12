import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:retail_demo/src/ui/screens/home/landing/widgets/offer_card.dart';
import 'package:retail_demo/src/ui/widgets/circle.dart';
import 'package:retail_demo/src/ui/widgets/svg_view.dart';
import 'package:retail_demo/src/utils/consts.dart';
import 'package:retail_demo/src/utils/screen_size_chart.dart';

class MultivendorShopsCard extends StatelessWidget {
  final List<MusicCardModel> shopsCard;
  MultivendorShopsCard({@required this.shopsCard});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            children: List.generate(shopsCard.length, (index) {
              return Container(
                margin: EdgeInsets.only(bottom: 5),
                height: SizeConfig.screenHeight * 0.22,
                  child: Card(
                  color: Colors.white,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Row(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
                              width: SizeConfig.screenWidth * 0.3,
                              height: SizeConfig.screenHeight * 0.17,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(shopsCard[index].url),
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
                                       shopsCard[index].title
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
                                     shopsCard[index].title,
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
                                     shopsCard[index].title),
                                 ),
                               ],
                             ),
                           ),
                           /*  Divider  */
                           Container (
                             margin: const EdgeInsets.only(left: 15,right: 15),
                             child: Row(
                               children: [
                                 Expanded(
                                   child: Divider(
                                       color: Colors.black
                                   ),
                                 )
                               ],
                            )
                           ),
                           /*  Pink circle single text */
                           Container (
                               margin: const EdgeInsets.only(left: 15),
                               child: Row(
                                 children: [
                                   new Circle(width: 15,
                                       height: 15,
                                       fillColor: Colors.pinkAccent,
                                   ),
                                   Expanded(
                                     child: Padding(
                                       padding: const EdgeInsets.only(left: 10,top: 5),
                                       child: Text(
                                           shopsCard[index].subtitle,
                                       style: TextThemes.bodyCard,),
                                     ),
                                   )
                                 ],
                               )
                           ),
                           /*  two Pink circle double text */
                           Expanded(
                             child: Container (
                                 margin: const EdgeInsets.only(left: 15,top:10,bottom: 5),
                                 child: Row(
                                   children: [
                                     new Circle(width: 15,
                                       height: 15,
                                       fillColor: Colors.pinkAccent,
                                     ),
                                     Expanded(
                                       child: Padding(
                                         padding: const EdgeInsets.only(left: 10,top: 5),
                                         child: Text(
                                             shopsCard[index].subtitle,
                                             style: TextThemes.bodyCard,
                                         ),
                                       ),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 15),
                                       child: new Circle(width: 15,
                                         height: 15,
                                         fillColor: Colors.pinkAccent,
                                       ),
                                     ),
                                     Expanded(
                                       child: Padding(
                                         padding: const EdgeInsets.only(left: 10,top: 5),
                                         child: Text(
                                             shopsCard[index].subtitle,
                                             style: TextThemes.bodyCard,
                                         ),
                                       ),
                                     ),
                                   ],
                                 )
                             ),
                           )
                         ],
                       ),
                     ),
                    ],
                  ),
                )
            );

                /*Row(
                children: <Widget>[
                  Column(
                    children: [

                    ],
                  )
                ],
                child: Card(
                  color: Colors.white,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Row(
                    children: [
                      Container(
                          width: SizeConfig.screenWidth * 0.2,
                          height: SizeConfig.screenHeight * 0.07,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(recentOrderDataList[index].url),
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          recentOrderDataList[index].title,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(recentOrderDataList[index].subtitle,
                            style: new TextStyle(
                                color: ColorConstants.darkGray,
                                fontSize: FontSize.fontSizeB4)),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: M2HomeRaisedButton(
                              StringConstants.LABEL_BUY_AGAIN,
                              ColorConstants.buttonBgColor,
                                  () => {null},
                              fontWeight: FontWeight.normal,
                              fontSize: FontSize.fontSizeB4,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );*/
            })));


  }
}
