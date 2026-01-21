import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

abstract interface class ConnectionChecker {
  Future<bool> get isConnected;
}

@Injectable(as: ConnectionChecker)
class ConnectionCheckerImpl implements ConnectionChecker {
  final Connectivity connectivity;

  ConnectionCheckerImpl(this.connectivity);

  @override
  Future<bool> get isConnected async {
    final result = await connectivity.checkConnectivity();
    if (kDebugMode) {
      print('Connectivity result: $result');
    }
    return result != ConnectivityResult.none;
  }
}
