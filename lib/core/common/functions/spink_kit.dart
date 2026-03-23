import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

Widget loadingWidget(BuildContext context) {
  return Center(
    child: SpinKitFadingFour(size: 30, color: context.color.spinKitColor),
  );
}
