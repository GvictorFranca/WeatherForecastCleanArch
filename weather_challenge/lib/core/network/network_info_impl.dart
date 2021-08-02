import 'package:connectivity_plus/connectivity_plus.dart';

import 'network_info.dart';

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectionChecker;
  NetworkInfoImpl({required this.connectionChecker});

  bool isConnected = true;

  @override
  Future<bool> checkConnection() async {
    var result = await connectionChecker.checkConnectivity();
    if (result == ConnectivityResult.none) {
      return isConnected = false;
    } else {
      return isConnected = true;
    }
  }
}
