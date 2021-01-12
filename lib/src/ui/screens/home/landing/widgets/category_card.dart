import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:retail_demo/src/ui/screens/home/landing/widgets/offer_card.dart';
import 'package:retail_demo/src/ui/widgets/base/base_list_view.dart';

class CategoryCardList extends BaseListView {
  CategoryCardList(List<MusicCardModel> cardData)
      : super(data: cardData, axis: Axis.horizontal);
  @override
  CategoryCardListState createState() => CategoryCardListState();
}

class CategoryCardListState
    extends BaseListViewState<CategoryCardList, MusicCardModel> {
  @override
  Widget buildBody(BuildContext context, data) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        children: <Widget>[
          Expanded(
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
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(data.title,
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.left),
          )
        ],
      ),
    );
  }
}
