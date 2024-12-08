import 'package:HT_ONE/Home/provider/AppConfigProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Home/Controller/home_page.dart';
import 'Home/Screen/SplashScreen.dart';

void main() {

  Provider.debugCheckInvalidValueType=null;
  runApp(

    MultiProvider(
      providers: [
        Provider<AppConfigProvider>(create: (_) => AppConfigProvider()),
      ],

      child: Splashscreen(),
    ),
  );

}

