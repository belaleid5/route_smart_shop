import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:route_smart/core/app/app_cubit/app_cubit_cubit.dart';
import 'package:route_smart/core/app/bloc_observer.dart';
import 'package:route_smart/core/app/connectivitiy_controller.dart';
import 'package:route_smart/core/app/env_varible.dart';
import 'package:route_smart/core/di/di.dart';
import 'package:route_smart/core/services/shared_pref/shared_pref.dart';
import 'package:route_smart/smart_shop_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvVariable.instance.init(EnvType.dev);
  Stripe.publishableKey = EnvVariable.instance.stripePublishableKey; 
  await ConnectivityController.instance.init();
  Bloc.observer = AppBlocObserver();
  await SharedPref().init();
  await setupDI();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    BlocProvider(
      create: (_) => sl<AppCubit>()..init(),
      child: const RouteSmartShopApp(),
    ),
  );
}