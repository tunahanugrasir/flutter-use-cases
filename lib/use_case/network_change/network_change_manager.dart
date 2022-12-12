import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

typedef NetworkCallBack = void Function(NetworkResult result);

abstract class INetworkChangeManager {
  Future<NetworkResult> checkNetworkFirstTime();
  void handleNetworkChange(NetworkCallBack onChange);
  dispose();
}

class NetworkChangeManager extends INetworkChangeManager {
  late final Connectivity _connectivity;
  StreamSubscription<ConnectivityResult>? _subscription;
  NetworkChangeManager() {
    _connectivity = Connectivity();
  }
  @override
  Future<NetworkResult> checkNetworkFirstTime() async {
    var connectivityResult = await (_connectivity.checkConnectivity());
    return NetworkResult.checkConnectivityResult(connectivityResult);
  }

  @override
  void handleNetworkChange(NetworkCallBack onChange) {
    _subscription = _connectivity.onConnectivityChanged.listen((event) {
      onChange.call(NetworkResult.checkConnectivityResult(event));
    });
  }

  @override
  dispose() {
    _subscription?.cancel();
  }
}

enum NetworkResult {
  on,
  off;

  static NetworkResult checkConnectivityResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.bluetooth:
        return NetworkResult.on;

      case ConnectivityResult.wifi:
        return NetworkResult.on;

      case ConnectivityResult.ethernet:
        return NetworkResult.on;

      case ConnectivityResult.mobile:
        return NetworkResult.on;

      case ConnectivityResult.vpn:
        return NetworkResult.on;

      case ConnectivityResult.none:
        return NetworkResult.off;
    }
  }
}
