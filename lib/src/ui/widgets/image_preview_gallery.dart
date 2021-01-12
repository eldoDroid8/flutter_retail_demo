import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:retail_demo/src/ui/screens/home/landing/widgets/offer_card.dart';
import 'package:retail_demo/src/utils/screen_size_chart.dart';

import 'dot_indicator.dart';


class ImagePageViewGalley extends StatefulWidget {
  final List<MusicCardModel> cardData;
  ImagePageViewGalley({this.cardData});
  @override
  ImagePageViewGalleyState createState() => ImagePageViewGalleyState();
}

class ImagePageViewGalleyState extends State<ImagePageViewGalley> {
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  final _kArrowColor = Colors.black.withOpacity(0.8);

  PageController controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        PageView.builder(
          controller: controller,
          itemBuilder: (context, position) {
            String url = widget.cardData[position].url;
            return Container(
              width: double.infinity,
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Image.network(
                  url,
                  fit: BoxFit.scaleDown,
                ),
              ),
            );
            //return new SingleImageTileView(imagePath: url,);
          },
          itemCount: widget.cardData?.length,
        ),
        Visibility(
          child: new Positioned(
            left: 0.0,
            right: 0.0,
            top: SizeConfig.screenHeight*0.5,
            child: new Container(
              child: new Center(
                child: new DotsIndicator(
                  controller: controller,
                  itemCount: widget.cardData.length,
                  onPageSelected: (int page) {
                    controller.animateToPage(
                      page,
                      duration: _kDuration,
                      curve: _kCurve,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
