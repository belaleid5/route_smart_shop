import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

Widget loadingWidgetSpinKit(BuildContext context) {
  return Center(
    child: SpinKitFadingFour(size: 30, color: context.colors.spinKitColor),
  );
}
