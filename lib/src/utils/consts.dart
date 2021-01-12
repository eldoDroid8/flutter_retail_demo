import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StringConstants {
  static const String LABEL_EDIT_FIELD_MOBILE_NO = "Enter Your Mobile Number";
  static const String HINT_EDIT_FIELD_MOBILE_NO = "Mobile Number";
  static const String LABEL_EDIT_FIELD_ENTER_OTP = "ENTER OTP";
  static const String LABEL_EDIT_FIELD_NAME = "Name";
  static const String LABEL_EDIT_FIELD_PASSWORD = "Password (Min 6 characters)";
  static const String LABEL_EDIT_FIELD_EMAIL_ADDRESS = "Email Address";

  static const String LABEL_AGREE_TERMS = "Agree Terms and Conditions";
  static const String LABEL_PROCEED = "Proceed";
  static const String LABEL_ACCOUNT = "ACCOUNT";
  static const String LABEL_ACCOUNT_CAMEL = "Account";
  static const String CAPTION_LOGIN =
      "Login/Create Account quickly to manage orders";

  static const String LABEL_COMPLETE_VERIFICATION =
      "COMPLETE MOBILE VERIFICATION";

  static const String LABEL_ENTER_OTP =
      "Enter the OTP sent to your provided mobile number";

  static const String LABEL_SEND_OTP = "Send OTP";

  static const String LABEL_OFFERS = "Offers";
  static const String LABEL_WISELY_FILTERED = "Wisely Filtered for you";
  static const String LABEL_INSPIRED_FROM_YOUR_SEARCH =
      "Inspired from your search";
  static const String LABEL_RECENTLY_ORDERED = "Recently Ordered";
  static const String LABEL_BUY_AGAIN = "Buy Again";
  static const String LABEL_TOP_PICKED_SHOPS_NEAR = "Top Picked Shops Near you";
  static const String LABEL_EDIT_FIELD_SEARCH_PRODUCTS = "Search Products";
  static const String LABEL_ORDERS = "Orders";
  static const String LABEL_ORDERS_SUBTITLE = "Orders, Transactions, Refunds&Payment Modes";
  static const String LABEL_MY_ACCOUNT = "My Account";
  static const String LABEL_MY_ACCOUNT_SUBTITLE = "Address Book, Password, Favourites & Offers";
  static const String LABEL_HELP = "Help";
  static const String LABEL_HELP_SUBTITLE = "FAQ & Links";
  static const String LABEL_LOGOUT = "Logout";
}

class SvgAssetPath {
  static const String BIG_EYES_OWL_PATH = "assets/images/big-eyes-owl.svg";
  static const String LIGHT_BULB = "assets/images/lightbulb.svg";
  static const String SHOPPING_BAG = "assets/images/shopping-bag.svg";
  static const String FILTER = "assets/images/filter.svg";
  static const String INDENT_ALL = "assets/images/indent-all.svg";
  static const String HEART = "assets/images/heart.svg";
  static const String CATEGORY = "assets/images/category.svg";
  static const String LOCATION = "assets/images/location.svg";
  static const String  SEARCH =  "assets/images/search.svg";
  static const String  DOWN_ARROW = "assets/images/down-arrow.svg";
  static const String  EDIT = "assets/images/edit.svg";
  static const String  TURN_OFF = "assets/images/turn-off.svg";
  static const String  OFFER_BADGE = "assets/images/offer_badge.svg";
}

class ColorConstants {
  static const Color veryLightGray = Color.fromRGBO(248, 248, 248, 1);
  static const Color darkGray = Color.fromRGBO(134, 134, 134, 1);
  static const Color buttonBgColor = Color.fromRGBO(240, 115, 35, 1);
  static const Color floatBg = Color.fromRGBO(183, 87, 62, 1);
  static const Color filterCircleBg = Color.fromRGBO(254, 203, 172, 1);
}

class FontSize {
  static const double fontSizeH4 = 16;
  static const double fontSizeH3 = 18;
  static const double fontSizeH2 = 20;
  static const double fontSizeH1 = 22;

  static const double fontSizeB3 = 12;
  static const double fontSizeB4 = 10;
}

class TextThemes {
  static const TextStyle header = TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.black,
      fontSize: 40,
      height: 0.5,
      fontWeight: FontWeight.w600);

  static const TextStyle body = TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.white,
      fontSize: 10,
      height: 0.5,
      fontWeight: FontWeight.w400);

  static const TextStyle bodyCard = TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.black,
      fontSize: 10,
      height: 0.5,
      fontWeight: FontWeight.w400);

  static const TextStyle progressFooter = TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.black,
      fontSize: 20,
      height: 0.5,
      fontWeight: FontWeight.w600);
}

class AppButtonStyles {
  static const ShapeBorder buttonBorderWithRoundRect = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      side: BorderSide(color: Colors.grey));
}

class TextFieldStyle {
  static const OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      borderSide: BorderSide(
        color: ColorConstants.darkGray,
      ));
}
