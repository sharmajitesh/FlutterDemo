
import 'dart:developer';

import 'package:HT_ONE/Home/ViewModel/SplashViewmodel.dart';
import 'package:HT_ONE/Home/provider/AppConfigProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Controller/home_page.dart';
import '../Model/AppConfigResponse.dart';




class Splashscreen extends StatefulWidget {
@override
_SplashscreenState createState() => _SplashscreenState();
}
class _SplashscreenState extends State<Splashscreen> {
  late Future<AppConfigResponse?> _bottomNavResponse;

  @override
  void initState() {
    super.initState();
    _bottomNavResponse = SplashViewmodel().fetchAppData();
  }


  @override
  Widget build(BuildContext context) {
    final dataService = Provider.of<AppConfigProvider>(context, listen: false);
    return FutureBuilder<AppConfigResponse?>(
      future: _bottomNavResponse,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show splash screen while waiting
          return Container(
                  color: const Color.fromARGB(255, 0, 177, 205),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  child: AspectRatio(aspectRatio:16/9,
                    child: Image.asset('assets/images/component_16_9.png'),
                  )

              );


        } else if (snapshot.hasData) {
          dataService.updateAppConfigData(snapshot.data);
          return const HomePage();
        } else {
          return  Container(
              color: const Color.fromRGBO(0, 112, 255, 100),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              child: AspectRatio(aspectRatio:16/9,
                child: Image.asset('assets/images/component_16_9.png'),
              )

          );
        }
      },
    );
  }
}




