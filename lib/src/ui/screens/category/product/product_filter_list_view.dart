import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:retail_demo/src/ui/screens/home/landing/widgets/offer_card.dart';
import 'package:retail_demo/src/ui/widgets/base/base_list_view.dart';
import 'package:retail_demo/src/utils/consts.dart';
import 'package:retail_demo/src/utils/screen_size_chart.dart';
import 'package:rxdart/rxdart.dart';

class ProdcutFilterListView extends BaseListView {
  PublishSubject<MusicCardModel> _filterClickSubject;
  Stream listItemClickStream;
  ProdcutFilterListView(List<MusicCardModel> cardData)
      : super(data: cardData, axis: Axis.vertical) {
    _filterClickSubject = new PublishSubject();
    listItemClickStream = _filterClickSubject.stream;
  }
  @override
  ProdcutFilterListViewState createState() => ProdcutFilterListViewState();
  void dispose() {
    _filterClickSubject.close();
  }

}

class ProdcutFilterListViewState extends BaseListViewState<ProdcutFilterListView, MusicCardModel> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildBody(BuildContext context, data) {
    return InkWell(
      onTap: () => {
        widget._filterClickSubject.sink.add(data)
      },
      child: Container(
        height: SizeConfig.screenHeight * 0.15,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                height: SizeConfig.screenHeight * 0.3,
                width: SizeConfig.screenWidth * 0.3,
                decoration: BoxDecoration(
                  color: ColorConstants.filterCircleBg,
                  shape: BoxShape.circle,
                ),
                child: FractionallySizedBox(
                    heightFactor: 0.7,
                    widthFactor: 0.7,
                    child:Container (
                      decoration: BoxDecoration(
                       shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(data.url,),
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                   )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(data.title,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center),
            )
          ],
        ),
      ),
    );
  }

}

