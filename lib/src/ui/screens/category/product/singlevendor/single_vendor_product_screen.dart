import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:retail_demo/src/ui/base/base_stateful.dart';
import 'package:retail_demo/src/ui/screens/category/product/product_filter_list_view.dart';
import 'package:retail_demo/src/ui/screens/category/product/products_card.dart';
import 'package:retail_demo/src/ui/screens/home/landing/widgets/offer_card.dart';
import 'package:retail_demo/src/ui/screens/home/landing/widgets/row_item_title.dart';
import 'package:retail_demo/src/ui/widgets/location_offers_top_bar.dart';
import 'package:retail_demo/src/utils/consts.dart';
import 'package:retail_demo/src/utils/screen_size_chart.dart';

class SingleVendorProductScreen extends BasePage {

  SingleVendorProductScreen({Key key}) : super(key: key);

  @override
  SingleVendorProductScreenState createState() => new SingleVendorProductScreenState();
}

class SingleVendorProductScreenState extends BaseState<SingleVendorProductScreen> with BasicPage {
  ProdcutFilterListView prodcutFilterListView;
  @override
  void initState() {
    prodcutFilterListView = new ProdcutFilterListView(cardsArr);
    prodcutFilterListView.listItemClickStream.listen((event) {
      print("clicked");
    });
    super.initState();
  }

  @override
  Widget body() {
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
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: new RowItemTitle(
                assetImagePath:SvgAssetPath.FILTER,
                showIconOnRowStart: false,
                rowEndAssetImagePath: SvgAssetPath.FILTER,
                rowTitleLabel: "All Products",
                showIconOnRowEdge: true,
                rowEndIconPressed: () => {
                  onFilterClicked()
                },),
            ),
          ),
          Expanded(
            flex: 10,
            child: Row(
              children: [
                Visibility(
                  visible:showFilter,
                  child: Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: prodcutFilterListView,
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10,),
                    child: Container(
                        child: new ProductCardList(cardsArr,getChildAspectRatioForGrid())),
                  ),
                ),
              ],
            ),
          ),
        ])
    );
  }

  double getChildAspectRatioForGrid(){
    if(showFilter){
      return (SizeConfig.screenWidth /
          SizeConfig.screenHeight / 1.02);
    }else{
      return (SizeConfig.screenWidth /
          SizeConfig.screenHeight /0.7);
    }

  }
  @override
  Future<bool> onBackPressed() async  {
    return true;
  }

  @override
  Widget getAppBar() {
    return null;
  }

  @override
  String screenName() {
    return "Product";
  }

  bool showFilter = false;


  void onFilterClicked(){
    if(!showFilter){
      setState(() {
        showFilter = true;
      });
    } else{
      setState(() {
        showFilter = false;
      });
    }
  }

  @override
  void dispose() {
    prodcutFilterListView.dispose();
    super.dispose();
  }
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