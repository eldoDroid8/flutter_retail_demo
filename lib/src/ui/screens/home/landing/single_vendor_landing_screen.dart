
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:retail_demo/src/model/landing_screen_list_item.dart';
import 'package:retail_demo/src/ui/screens/category/product/singlevendor/single_vendor_product_screen.dart';
import 'package:retail_demo/src/ui/screens/home/landing/widgets/category_card.dart';
import 'package:retail_demo/src/ui/screens/home/landing/widgets/offer_card.dart';
import 'package:retail_demo/src/ui/widgets/base/base_list_view.dart';
import 'package:retail_demo/src/utils/consts.dart';
import 'package:retail_demo/src/utils/screen_size_chart.dart';
import 'base_landing_screen.dart';
import 'widgets/ai_card.dart';
import 'widgets/image_page_view.dart';
import 'widgets/recent_order.dart';
import 'widgets/row_item_title.dart';
import 'widgets/single_image_tile_view.dart';

class SingleVendorLandingScreen extends  BaseLandingScreen {

  @override
  Widget getMainListItem() {
      List<LandingScreenMainListItem> viewItems = List();
      LandingScreenMainListItem item1 = LandingScreenMainListItem(type: ViewType.SingleCard);
      LandingScreenMainListItem item2 = LandingScreenMainListItem(type: ViewType.DualCard);
      LandingScreenMainListItem item3 = LandingScreenMainListItem(type: ViewType.MultiHorizontalList);
      LandingScreenMainListItem item4 = LandingScreenMainListItem(type: ViewType.RowTitle,rowHeading:StringConstants.LABEL_WISELY_FILTERED ,
          svgPath: SvgAssetPath.BIG_EYES_OWL_PATH,showIconOnRowEnd: true);
      LandingScreenMainListItem item5 = LandingScreenMainListItem(type: ViewType.AiCard);
      LandingScreenMainListItem item6 = LandingScreenMainListItem(type: ViewType.RowTitle,rowHeading:StringConstants.LABEL_INSPIRED_FROM_YOUR_SEARCH ,
          svgPath: SvgAssetPath.LIGHT_BULB,showIconOnRowEnd: false);
      LandingScreenMainListItem item7 = LandingScreenMainListItem(type: ViewType.AiCard);
      LandingScreenMainListItem item8 = LandingScreenMainListItem(type: ViewType.MultiViewPage);
      LandingScreenMainListItem item9 = LandingScreenMainListItem(type: ViewType.RowTitle,rowHeading:StringConstants.LABEL_RECENTLY_ORDERED ,
          svgPath: SvgAssetPath.SHOPPING_BAG,showIconOnRowEnd: true);
      LandingScreenMainListItem item10 = LandingScreenMainListItem(type: ViewType.RecentOrder);
      LandingScreenMainListItem item11 = LandingScreenMainListItem(type: ViewType.DualCard);
      viewItems.add(item1);
      viewItems.add(item2);
      viewItems.add(item3);
      viewItems.add(item4);
      viewItems.add(item5);
      viewItems.add(item6);
      viewItems.add(item7);
      viewItems.add(item8);
      viewItems.add(item9);
      viewItems.add(item10);
      viewItems.add(item11);
      return new MainCardList(viewItems);
  }

}


class MainCardList extends BaseListView {
  MainCardList(List<LandingScreenMainListItem> cardData)
      : super(data: cardData, axis: Axis.vertical);
  @override
  MainCardListState createState() => MainCardListState();
}

class MainCardListState extends BaseListViewState<MainCardList, LandingScreenMainListItem> {
  @override
  Widget buildBody(BuildContext context, LandingScreenMainListItem data) {
    Widget listWidget;
    switch(data.type) {

      case ViewType.SingleCard:
        listWidget =  new SingleImageTileView(
          imagePath: 'https://i.ibb.co/r3xgLnm/chicken-rs-300.jpg',
        );
        break;
      case ViewType.DualCard:
        listWidget =  Container(
          height: SizeConfig.screenHeight * 0.2,
          child: new OfferCardList(data.cardsArr)
        );
        break;

      case ViewType.MultiHorizontalList:
        listWidget = Container(
          height: SizeConfig.screenHeight * 0.2,
          child: new CategoryCardList(data.cardsArr),
        );
        break;

      case ViewType.MultiViewPage:
        listWidget = Container(
            height: SizeConfig.screenHeight * 0.25,
            child: new ImagePageView(cardData: data.cardsArr));
        break;
      case ViewType.AiCard:
        listWidget =  Container(
            height: SizeConfig.screenHeight * 0.25,
            child: new AiCardList(data.cardsArr)
        );
        break;

      case ViewType.RecentOrder:
        listWidget =  Container(
            margin: EdgeInsets.only(top: 10,bottom: 10),
            child: new RecentOrderCardView(recentOrderDataList: data.cardsArr));
        break;
      case ViewType.RowTitle:
        listWidget =  new RowItemTitle(
            assetImagePath: data.svgPath,
            rowTitleLabel: data.rowHeading,
            showIconOnRowEdge: data.showIconOnRowEnd);
        break;

      case ViewType.EmptySpace: {
        listWidget = SizedBox(
          height: SizeConfig.screenHeight * data.emptySpaceHeight,
        );
        break;
      }

      case ViewType.MultivendorShops: {
        break;
      }
    }
    return InkWell(child: listWidget,
     onTap: gotoProductDetailPage,);
  }

  void gotoProductDetailPage(){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => SingleVendorProductScreen(),
        ));
    /*Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => SingleVendorProductScreen()));*/
  }

}