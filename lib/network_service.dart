import 'dart:async';
import 'dart:ui';

import 'package:bot_toast/bot_toast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

enum NetworkStatus { online, offline }

class NetworkService {
  StreamController<NetworkStatus> controller = StreamController();

  VoidCallback? cancel;

  NetworkService() {
    Connectivity().onConnectivityChanged.listen((event) {
      controller.add(_networkStatus(event));
    });
  }

  NetworkStatus _networkStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      if (cancel != null) {
        cancel!();
      }
    } else {
      cancel = BotToast.showSimpleNotification(title: "xxxx", duration: Duration(days: 1));
    }

    return connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi
        ? NetworkStatus.online
        : NetworkStatus.offline;
  }
}
