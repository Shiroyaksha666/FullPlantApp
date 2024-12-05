import 'package:flutter/material.dart';

class WoocommerceInfo {
  //ConsumerKey and ConsumerSecret

  static String consumerKey = "ck_3e28380ab501b45977c2aa118e7d440b167118c3";
  static String consumerSecret = "cs_2981e2a3fb65d2c707e927e12293473cc65b019e";

  //Base URL
  static String mainUrl = "https://planta.s474.site/wp-json/wc/v3/";
  //JWT Auth
  static String tokenUrl = "https://planta.s474.site/wp-json/jwt-auth/v1/token";

  //Endpoint URL

  static String customerUrl = "customers";
}

class Consts {
  static Color primaryColor = const Color(0xff0a5108);
  static Color blackColor = Colors.black;

  static String titleOne = "گیاهان را بهتر از قبل درک کن";
  static String descriptionOne =
      "در مورد نگه داری گل و گیاهان میتوانی اطلاعات کسب کنی";
  static String titleTwo = "با گیاهان جدید آشنا شو";
  static String descriptionTwo =
      "رز مشکی یا گل رز دوست داری؟ اینجا میتونی پیداش کنی";
  static String titleThree = "با یک گل بهار نمیشود، گل بکار";
  static String descriptionThree =
      "هر گلی نیاز داشته باشید در این اپلیکیشن پیدا میکنید";
}
