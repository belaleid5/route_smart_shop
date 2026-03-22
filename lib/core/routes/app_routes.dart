import 'package:flutter/material.dart';
import 'package:route_smart/core/common/animations/custom_page_route.dart';
import 'package:route_smart/core/common/screens/empty_screen.dart';
import 'package:route_smart/core/routes/routes_names.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
   
      case AppRoutesNames.emptyScreen:
        return CustomPageRoute(settings: settings, page: const EmptyScreen());

      default:
        return CustomPageRoute(
          settings: settings,
          page: Scaffold(
            body: Center(
              child: Text('Page not found: ${settings.name}'),
            ),
          ),
        );
    }
  }
}
