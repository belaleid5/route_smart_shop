// lib/main_app.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/app_cubit/app_cubit_cubit.dart';
import 'package:route_smart/core/app/connectivitiy_controller.dart';
import 'package:route_smart/core/app/env_varible.dart';
import 'package:route_smart/core/app/theme/app_theme.dart';
import 'package:route_smart/core/common/screens/no_network.dart';
import 'package:route_smart/core/di/di.dart';
import 'package:route_smart/core/helper/app_responsive.dart';
import 'package:route_smart/core/language/app_localizations_setup.dart';
import 'package:route_smart/core/routes/app_routes.dart';
import 'package:route_smart/core/routes/routes_names.dart';
import 'package:route_smart/core/services/shared_pref/shared_keys.dart';
import 'package:route_smart/core/services/shared_pref/shared_pref.dart';

class RouteSmartShopApp extends StatelessWidget {
  const RouteSmartShopApp({super.key});

  static const double _designWidth = 430;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (context, isConnected, _) {
        if (!isConnected) {
          return MaterialApp(
            debugShowCheckedModeBanner: EnvVariable.instance.isDebugMode,
            home: const NoNetwork(),
          );
        }

        return BlocProvider(
          create: (_) => sl<AppCubit>()
            ..changeAppThemeMode(
              sharedMode: SharedPref().getBoolean(PrefKeys.themeMode) ?? false,
            ),
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: AppResponsive(
              width: _designWidth,
              child: BlocBuilder<AppCubit, AppState>(
                builder: (context, state) {
                  final cubit = context.read<AppCubit>();
                  return MaterialApp(
                    debugShowCheckedModeBanner:
                        EnvVariable.instance.isDebugMode,
                    initialRoute: AppRoutesNames.verifyCode,
                    onGenerateRoute: AppRouter.onGenerateRoute,
                    theme: AppTheme.light,
                    darkTheme: AppTheme.dark,

                    themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,

                    supportedLocales: AppLocalizationsSetup.supportedLocales,
                    localizationsDelegates:
                        AppLocalizationsSetup.localizationsDelegates,
                    locale: const Locale('en'),
                    localeResolutionCallback:
                        AppLocalizationsSetup.localeResolutionCallback,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
