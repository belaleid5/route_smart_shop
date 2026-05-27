import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/app_cubit/app_cubit_cubit.dart';
import 'package:route_smart/core/app/connectivitiy_controller.dart';
import 'package:route_smart/core/app/env_varible.dart';
import 'package:route_smart/core/app/theme/app_theme.dart';
import 'package:route_smart/core/common/screens/no_network.dart';
import 'package:route_smart/core/helper/app_responsive.dart';
import 'package:route_smart/core/helper/navigator_key.dart';
import 'package:route_smart/core/language/app_localizations_setup.dart';
import 'package:route_smart/core/routes/app_routes.dart';
import 'package:route_smart/core/routes/routes_names.dart';

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
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: EnvVariable.instance.isDebugMode,
            home: const NoNetwork(),
          );
        }

        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: AppResponsive(
            width: _designWidth,
            child: Builder(
              builder: (context) {
                final isDark = context.select<AppCubit, bool>((c) => c.isDark);
                final langCode = context.select<AppCubit, String>(
                  (c) => c.currentLangCode,
                );

                return MaterialApp(
                
                  debugShowCheckedModeBanner: EnvVariable.instance.isDebugMode,
                  initialRoute: AppRoutesNames.splashPage,
                  onGenerateRoute: AppRouter.onGenerateRoute,

                  theme: AppTheme.buildLight(langCode),
                  darkTheme: AppTheme.buildDark(langCode),
                  themeMode: isDark ? ThemeMode.dark : ThemeMode.light,

                  locale: Locale(langCode),
                  supportedLocales: AppLocalizationsSetup.supportedLocales,
                  localizationsDelegates:
                      AppLocalizationsSetup.localizationsDelegates,
                  localeResolutionCallback:
                      AppLocalizationsSetup.localeResolutionCallback,

                  builder: (context, child) => Directionality(
                    textDirection: langCode == 'ar'
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child: child!,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
