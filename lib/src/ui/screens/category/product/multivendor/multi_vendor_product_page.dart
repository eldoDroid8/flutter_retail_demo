import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:retail_demo/src/ui/base/base_stateless.dart';
import 'package:retail_demo/src/ui/screens/category/product/multivendor/shops_info_card.dart';
import 'package:retail_demo/src/ui/screens/category/product/products_card.dart';
import 'package:retail_demo/src/ui/screens/home/landing/widgets/offer_card.dart';
import 'package:retail_demo/src/ui/screens/home/landing/widgets/row_item_title.dart';
import 'package:retail_demo/src/ui/widgets/location_offers_top_bar.dart';
import 'package:retail_demo/src/utils/consts.dart';
import 'package:retail_demo/src/utils/screen_size_chart.dart';

class MultiVendorProductScreen extends BaseStatelessWidget with BasicStateless {

  @override
  Widget getBodyContent(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: new LocationOffersTopbar(),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: new ShopsInfoCard(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: rowtitle,
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                  child: new ProductCardList(cardsArr,getChildAspectRatioForGrid())),
            ),
          ),
        ])
    );
  }

  double getChildAspectRatioForGrid(){
    return (SizeConfig.screenWidth /
        SizeConfig.screenHeight / 0.7);
  }

  Widget rowtitle = new RowItemTitle(
      assetImagePath:SvgAssetPath.FILTER,
      showIconOnRowStart: false,
      rowEndAssetImagePath: SvgAssetPath.FILTER,
      rowTitleLabel: "All Products",
      showIconOnRowEdge: true);

  List<MusicCardModel> cardsArr = [
    MusicCardModel(
        url: "https://i.ibb.co/G2C5vrR/meat3res300.jpg",
        title: "Beef",
        subtitle: "Cubes"),
    MusicCardModel(
        url: "https://i.ibb.co/2nmZrdQ/meat2res240.jpg",
        title: "Buffallo",
        subtitle: "Steaks"),
    MusicCardModel(
        url: "https://i.ibb.co/r3xgLnm/chicken-rs-300.jpg",
        title: "Chicken",
        subtitle: "Chicken Drumsticks"),
    MusicCardModel(
        url: "https://i.ibb.co/xH1B1J1/fish3res300.jpg",
        title: "Fish",
        subtitle: "Tuna"),
    MusicCardModel(
        url: "https://i.ibb.co/K6fd7Hx/fishres300.jpg",
        title: "Fish",
        subtitle: "Pomfret"),
    MusicCardModel(
        url: "https://i.ibb.co/yh4QZZs/fishres240.jpg",
        title: "Fish",
        subtitle: "Prawns"),
    MusicCardModel(
        url: "https://i.ibb.co/YP2qw6M/grocery2res240.jpg",
        title: "Grocery",
        subtitle: "Rice"),
  ];
}