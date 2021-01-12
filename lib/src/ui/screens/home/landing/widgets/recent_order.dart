import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:retail_demo/src/ui/screens/home/landing/widgets/offer_card.dart';
import 'package:retail_demo/src/ui/widgets/raised_button.dart';
import 'package:retail_demo/src/utils/consts.dart';
import 'package:retail_demo/src/utils/screen_size_chart.dart';
class RecentOrderCardView extends StatelessWidget {
  final List<MusicCardModel> recentOrderDataList;

  //final MusicCardModel cardData;
  RecentOrderCardView({@required this.recentOrderDataList});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            children: List.generate(recentOrderDataList.length, (index) {
              return Container(
                margin: EdgeInsets.only(bottom: 5),
                height: SizeConfig.screenHeight * 0.15,
                child: Card(
                  color: Colors.white,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        padding: const EdgeInsets.only(left: 10, top: 5),
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
              );
            })));


  }
}


