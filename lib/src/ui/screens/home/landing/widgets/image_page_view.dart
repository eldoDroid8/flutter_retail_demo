import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:retail_demo/src/ui/screens/home/landing/widgets/single_image_tile_view.dart';
import 'package:retail_demo/src/ui/widgets/dot_indicator.dart';

import 'offer_card.dart';

class ImagePageView extends StatefulWidget {
  final List<MusicCardModel> cardData;
  ImagePageView({this.cardData});
  @override
  ImagePageViewState createState() => ImagePageViewState();
}

class ImagePageViewState extends State<ImagePageView> {
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
            return new SingleImageTileView(imagePath: url,);
          },
          itemCount: widget.cardData?.length,
        ),
        new Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: new Container(
            padding: const EdgeInsets.all(20.0),
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
      ],
    );
  }
}
