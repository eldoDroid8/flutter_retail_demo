import 'dart:async';

import 'package:flutter/material.dart';
import 'package:retail_demo/src/ui/screens/category/product/singlevendor/single_vendor_product_screen.dart';
import 'package:retail_demo/src/ui/screens/home/home_screen.dart';
import 'package:retail_demo/src/utils/screen_size_chart.dart';

import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    createSomeDelay().then((status) {
      //navigateToLogin();
      navigateToHome();
      //navigateToProductDetail();
    });
  }

  Future<bool> createSomeDelay() async {
    await Future.delayed(Duration(seconds: 1), () {});

    return true;
  }

  void navigateToHome() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
  }

  void navigateToProductDetail() {
    /*Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => ProductDetailScreen()));*/
    /*Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => MultiVendorProductScreen()));*/
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => SingleVendorProductScreen()));
  }

  void navigateToLogin() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    new SizeConfig().init(context);
    return Scaffold(
        body: new Image.asset(
      'assets/images/splash.jpeg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
    ));
  }
}
