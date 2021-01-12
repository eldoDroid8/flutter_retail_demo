import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:retail_demo/src/ui/widgets/base/base_list_view.dart';
import 'package:retail_demo/src/ui/widgets/svg_view.dart';

class OfferCardList extends BaseListView {
  OfferCardList(List<MusicCardModel> cardData)
      : super(data: cardData, axis: Axis.horizontal);
  @override
  OfferCardListState createState() => OfferCardListState();
}

class OfferCardListState
    extends BaseListViewState<OfferCardList, MusicCardModel> {
  @override
  Widget buildBody(BuildContext context, data) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(data.url),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 5, right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      data.subtitle,
                      style: new TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: new SvgAsset(
                        width: 16,
                        height: 16,
                        imagePath: "assets/images/right-arrow.svg",
                        iconColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class MusicCardModel {
  String title;
  String subtitle;
  String url;

  MusicCardModel(
      {@required this.title, @required this.subtitle, @required this.url});
}
