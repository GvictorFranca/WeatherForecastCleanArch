import 'package:connectivity_plus/connectivity_plus.dart';

import 'network_info.dart';

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectionChecker;
  NetworkInfoImpl(this.connectionChecker);

  bool _isConnected = false;

  @override
  Future<bool> checkConnection() async {
    var result = await connectionChecker.checkConnectivity();
    if (result == ConnectivityResult.none) {
      return _isConnected;
    } else {
      _isConnected = true;
      return _isConnected;
    }
  }

  bool get isConnected => _isConnected;
}
