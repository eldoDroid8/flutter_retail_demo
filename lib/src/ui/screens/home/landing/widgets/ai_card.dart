import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retail_demo/src/ui/widgets/base/base_list_view.dart';
import 'package:retail_demo/src/utils/screen_size_chart.dart';

import 'offer_card.dart';

class AiCardList extends BaseListView {
  AiCardList(List<MusicCardModel> cardData)
      : super(data: cardData, axis: Axis.horizontal);
  @override
  AiCardListState createState() => AiCardListState();
}

class AiCardListState extends BaseListViewState<AiCardList, MusicCardModel> {
  @override
  Widget buildBody(BuildContext context, data) {
    return AiCard(cardData: data);
  }
}

class AiCard extends StatelessWidget {
  //final AiCardData aiCardData;
  final MusicCardModel cardData;
  AiCard({@required this.cardData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5, top: 10),
      width: SizeConfig.screenWidth * 0.35,
      child: Card(
        color: Colors.white,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: SizeConfig.screenWidth * 0.2,
                height: SizeConfig.screenHeight * 0.1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(cardData.url),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                cardData.title,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(cardData.subtitle,
                  style: new TextStyle(color: Colors.red)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Text(
                cardData.subtitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AiCardData {
  String imageUrl;
  String productTitle;
  String productFeatureTitle;
  String productPrice;
  AiCardData(
      {this.imageUrl,
      this.productTitle,
      this.productFeatureTitle,
      this.productPrice});
}
