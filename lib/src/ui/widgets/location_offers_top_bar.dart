import 'package:flutter/cupertino.dart';
import 'package:retail_demo/src/ui/screens/home/landing/widgets/location_dropdown.dart';
import 'package:retail_demo/src/ui/widgets/svg_view.dart';
import 'package:retail_demo/src/utils/consts.dart';
import 'package:retail_demo/src/utils/screen_size_chart.dart';

import 'drop_down.dart';

class LocationOffersTopbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      height: SizeConfig.screenHeight * 0.03,
      width: SizeConfig.screenWidth,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new LocationDropdown(
                      onDropDownSelected: (WidgetItem data) =>
                          {print("data selected->" + data.index.toString())})
                ]),
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new SvgAsset(
                      width: 24,
                      height: 24,
                      imagePath: "assets/images/sale.svg"),
                  Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text(StringConstants.LABEL_OFFERS)),
                ]),
          )
        ],
      ),
    );
  }
}
