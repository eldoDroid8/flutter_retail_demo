import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retail_demo/src/ui/base/base_stateful.dart';
import 'package:retail_demo/src/ui/screens/account/account_screen.dart';
import 'package:retail_demo/src/ui/screens/category/category_screen.dart';
import 'package:retail_demo/src/ui/screens/home/landing/multivendor/multivendor_landing_screen.dart';
import 'package:retail_demo/src/ui/screens/home/landing/widgets/offer_card.dart';
import 'package:retail_demo/src/utils/screen_size_chart.dart';

import '../../widgets/svg_view.dart';
import 'landing/single_vendor_landing_screen.dart';

class HomeScreen extends BasePage {
  HomeScreen({Key key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends BaseState<HomeScreen> with BasicPage {
  PageController bottonPageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return super.build(context);
  }

  @override
  Widget fab() {
    return Container(
        child: Container(
          height: 72,
          width: 72,
          // backgroundColor: ColorConstants.floatBg,
          child: FittedBox(
              child: FloatingActionButton(
                  onPressed: () {},
                  child: SvgAsset(
                      height: 18,
                      width: 18,
                      imagePath: 'assets/images/search.svg',
                      iconColor: Colors.white))),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [Colors.red, Colors.blue])),
        ));
  }

  @override
  Widget bottomNavigation() {
    return BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: 72,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  icon: SvgAsset(
                      height: 120,
                      width: 120,
                      imagePath: 'assets/images/indent-all.svg'),
                  onPressed: () { bottonPageController.jumpToPage(0);}),
              IconButton(
                  icon: SvgAsset(
                      height: 120,
                      width: 120,
                      imagePath: 'assets/images/category.svg'),
                  onPressed: () {bottonPageController.jumpToPage(1);}),
              SizedBox(width: 40), // The dummy child
              IconButton(
                  icon: SvgAsset(
                      height: 120,
                      width: 120,
                      imagePath: 'assets/images/cart.svg'),
                  onPressed: () {bottonPageController.jumpToPage(2);}),
              IconButton(
                  icon: SvgAsset(
                      height: 120,
                      width: 120,
                      imagePath: 'assets/images/profile.svg'),
                  onPressed: () {bottonPageController.jumpToPage(3);}),
            ],
          ),
        ));
  }

  @override
  String screenName() {
    return "M2Home";
  }

  @override
  Widget body() {
    return PageView(
      controller: bottonPageController,
      onPageChanged: (int) {
        print('Page Changes to index $int');
      },
      children: <Widget>[
        new SingleVendorLandingScreen(),
        new MultiVendorLandingScreen(),
        new CategoryScreen(),
        new AccountScreen()
      ],
      physics: NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
    );
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

  @override
  Widget getAppBar() {
    return  null;
  }
}
