import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/custom_toast.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_bloc.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_state.dart';
import 'package:route_smart/features/wishlist/presention/refactor/wishlist_body.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocListener<WishlistBloc, WishlistState>(
      listener: (context, state) {
        switch (state) {
          case WishlistFailure(:final message):
            CustomToast.showError(context, context.translate(message));
          case WishlistActionFailure(:final message):
            CustomToast.showError(context, context.translate(message));
          default:
            break;
        }
      },
      child: Scaffold(
        backgroundColor: context.colors.background,
        body: const WishlistBody(),
      ),
    );
  }
}