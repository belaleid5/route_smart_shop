import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityController {
  ConnectivityController._();


  static final ConnectivityController instance = ConnectivityController._();


  final ValueNotifier<bool> isConnected = ValueNotifier(true);


  StreamSubscription<List<ConnectivityResult>>? _subscription;

  Future<void> init() async {
    final result = await Connectivity().checkConnectivity();
    final first = result.isNotEmpty ? result.first : ConnectivityResult.none;
    isInternetConnected(first);

 
    _subscription = Connectivity().onConnectivityChanged.listen((event) {
      final first = event.isNotEmpty ? event.first : ConnectivityResult.none;
      isInternetConnected(first);
    });

 
  }

  /// Handle connectivity changes
  bool isInternetConnected(ConnectivityResult? result) {
    if (result == ConnectivityResult.none) {
      isConnected.value = false;
 
      return false;
    } else if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      isConnected.value = true;
  
      return true;
    }
    return false;
  }

  void dispose() {
    _subscription?.cancel();
    _subscription = null;
    isConnected.dispose();
  
  }
}