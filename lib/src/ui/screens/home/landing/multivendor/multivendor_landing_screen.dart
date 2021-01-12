import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:retail_demo/src/model/landing_screen_list_item.dart';
import 'package:retail_demo/src/ui/screens/category/product/multivendor/multi_vendor_product_page.dart';
import 'package:retail_demo/src/ui/screens/home/landing/multivendor/multivendor_shops_card.dart';
import 'package:retail_demo/src/ui/screens/home/landing/widgets/category_card.dart';
import 'package:retail_demo/src/ui/screens/home/landing/widgets/image_page_view.dart';
import 'package:retail_demo/src/ui/screens/home/landing/widgets/offer_card.dart';
import 'package:retail_demo/src/ui/screens/home/landing/widgets/row_item_title.dart';
import 'package:retail_demo/src/ui/screens/home/landing/widgets/single_image_tile_view.dart';
import 'package:retail_demo/src/ui/widgets/base/base_list_view.dart';
import 'package:retail_demo/src/utils/consts.dart';
import 'package:retail_demo/src/utils/screen_size_chart.dart';

import '../base_landing_screen.dart';

class MultiVendorLandingScreen extends  BaseLandingScreen {

  @override
  Widget getMainListItem() {
    List<LandingScreenMainListItem> viewItems = List();
    LandingScreenMainListItem item2 = LandingScreenMainListItem(
        type: ViewType.DualCard);

    LandingScreenMainListItem item4 = LandingScreenMainListItem(
        type: ViewType.RowTitle,
        showIconOnRowStart: false,
        rowHeading: StringConstants.LABEL_TOP_PICKED_SHOPS_NEAR,
        svgPath: SvgAssetPath.FILTER,
        svgPathRowEnd: SvgAssetPath.FILTER,
        showIconOnRowEnd: true);

    LandingScreenMainListItem item3 = LandingScreenMainListItem(
        type: ViewType.MultiHorizontalList);

    LandingScreenMainListItem item8 = LandingScreenMainListItem(type: ViewType.MultivendorShops);

    LandingScreenMainListItem item6 = LandingScreenMainListItem(type: ViewType.SingleCard);


    viewItems.add(item2);
    viewItems.add(item4);
    viewItems.add(item8);
    viewItems.add(item3);
    viewItems.add(item6);

    return new MultiVendorContainerList(viewItems);
  }
}

class MultiVendorContainerList extends BaseListView {
  MultiVendorContainerList(List<LandingScreenMainListItem> cardData)
      : super(data: cardData, axis: Axis.vertical);
  @override
  MultiVendorContainerListState createState() => new MultiVendorContainerListState();
}

class MultiVendorContainerListState extends BaseListViewState<MultiVendorContainerList, LandingScreenMainListItem> {

  @override
  Widget buildBody(BuildContext context, LandingScreenMainListItem data) {
    Widget listWidget;
    switch(data.type) {

      case ViewType.SingleCard:
        listWidget =  Padding(
          padding: const EdgeInsets.only(top: 10),
          child: new SingleImageTileView(
            imagePath: 'https://i.ibb.co/r3xgLnm/chicken-rs-300.jpg',
          ),
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
      case ViewType.MultivendorShops: {
       listWidget =  Container(
            margin: EdgeInsets.only(top: 10,bottom: 10),
            child: new MultivendorShopsCard(shopsCard: data.cardsArr));
        break;
      }
      case ViewType.AiCard:

        break;

      case ViewType.RecentOrder:
        break;
      case ViewType.RowTitle:
        listWidget =  new RowItemTitle(
            assetImagePath:data.svgPath,
            showIconOnRowStart: data.showIconOnRowStart,
            rowEndAssetImagePath:data.svgPathRowEnd,
            rowTitleLabel: data.rowHeading,
            showIconOnRowEdge: data.showIconOnRowEnd);
        break;

      case ViewType.EmptySpace: {
        listWidget = SizedBox(
          height: SizeConfig.screenHeight * data.emptySpaceHeight,
        );
      }
    }
    return InkWell(child: listWidget,
    onTap: gotoProductDetailPage,);
  }

  void gotoProductDetailPage(){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => MultiVendorProductScreen(),
        ));
    /*Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => SingleVendorProductScreen()));*/
  }

}

