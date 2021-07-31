import 'package:connectivity_plus/connectivity_plus.dart';

import 'network_info.dart';

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectionChecker;
  NetworkInfoImpl(this.connectionChecker);

  bool isConnected = false;

  @override
  Future<bool> checkConnection() async {
    var result = await connectionChecker.checkConnectivity();
    if (result == ConnectivityResult.none) {
      return isConnected;
    } else {
      isConnected = true;
      return isConnected;
    }
  }
}
