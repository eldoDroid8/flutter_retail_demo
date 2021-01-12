import 'package:retail_demo/src/ui/screens/home/landing/widgets/offer_card.dart';

class LandingScreenMainListItem {
  LandingScreenMainListItem({this.type,this.svgPath,this.rowHeading, this.showIconOnRowEnd: false, this.emptySpaceHeight,this.svgPathRowEnd,
  this.showIconOnRowStart});
ViewType type;
String svgPath;
String svgPathRowEnd;
String rowHeading;
bool showIconOnRowEnd;
bool showIconOnRowStart;
double emptySpaceHeight;
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
enum ViewType {SingleCard, DualCard,MultiHorizontalList,RowTitle,AiCard,MultiViewPage,RecentOrder,EmptySpace,MultivendorShops}