import 'package:flutter/widgets.dart';
import 'package:retail_demo/src/ui/widgets/location_offers_top_bar.dart';

abstract class BaseLandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
          child: Column(children: <Widget>[
          Expanded(
            flex:1,
              child: new LocationOffersTopbar()),
            Expanded(
                flex:15,
            child: getMainListItem()),
      ])
    );
  }
  Widget getMainListItem();
}
