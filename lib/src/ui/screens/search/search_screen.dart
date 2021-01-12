import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:retail_demo/src/ui/base/base_stateless.dart';
import 'package:retail_demo/src/ui/widgets/edit_field.dart';
import 'package:retail_demo/src/ui/widgets/svg_view.dart';
import 'package:retail_demo/src/utils/consts.dart';

class SearchScreen extends BaseStatelessWidget with BasicStateless {
  @override
  Widget getBodyContent(BuildContext context) {
    return Container (
      color: ColorConstants.darkGray,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    new EditField(
                      StringConstants.LABEL_EDIT_FIELD_SEARCH_PRODUCTS,
                      StringConstants.LABEL_EDIT_FIELD_SEARCH_PRODUCTS,
                      textInputType: TextInputType.text,
                    ),
                    new SvgAsset(width: 18, height: 18, imagePath: SvgAssetPath.SEARCH)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}