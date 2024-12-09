
import 'dart:developer';
import 'package:flutter/cupertino.dart';

import '../Model/AppConfigResponse.dart';

class AppConfigProvider extends ChangeNotifier {


   AppConfigResponse? _appConfigResponse;

   AppConfigResponse? get appConfigResponse => _appConfigResponse;

  void updateAppConfigData(AppConfigResponse? paramAppConfigResponse) {

    _appConfigResponse = paramAppConfigResponse;
    notifyListeners(); // Notify widgets listening to this class
  }
}