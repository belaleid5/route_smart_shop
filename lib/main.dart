
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/bloc_observer.dart';
import 'package:route_smart/core/app/connectivitiy_controller.dart';
import 'package:route_smart/core/app/env_varible.dart';
import 'package:route_smart/core/di/di.dart';
import 'package:route_smart/core/services/shared_pref/shared_pref.dart';
import 'package:route_smart/smart_shop_app.dart';

void main() async {
  await EnvVariable.instance.init(EnvType.dev);
  await ConnectivityController.instance.init();

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await SharedPref().initPreferences();
  await setupDI();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(DevicePreview(builder: (context) => const RouteSmartShopApp()));
}