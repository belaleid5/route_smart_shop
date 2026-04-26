import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/di/di.dart';
import 'package:route_smart/core/services/flutter_secure.dart';
import 'package:route_smart/core/services/shared_pref/shared_keys.dart';
import 'package:route_smart/features/reviews/presention/manger/reviews_bloc.dart';
import 'package:route_smart/features/reviews/presention/manger/reviews_state.dart';
import 'package:route_smart/features/reviews/presention/widgets/reviews_bloc_builder.dart';


class ReviewsView extends StatefulWidget {
  const ReviewsView({super.key, required this.productId});
  final String productId;

  @override
  State<ReviewsView> createState() => _ReviewsViewState();
}

class _ReviewsViewState extends State<ReviewsView> {
  late final Future<String?> _userIdFuture;

  @override
  void initState() {
    super.initState();
    _userIdFuture = sl<SecureStorage>().getString(PrefKeys.userId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReviewsBloc, ReviewsState>(
    buildWhen: (previous, current) {
        return current.maybeWhen(
          initial: () => true,
          loading: () => true,
          success: (_) => true,
          error: (_) => true,
     
          orElse: () => false, 
        );
      },

      listenWhen: (previous, current) {
        return current.maybeWhen(
          reviewCreated: () => true,
          reviewUpdated: () => true,
          reviewDeleted: () => true,
          actionError: (_) => true,
          orElse: () => false,
        );
      },
      listener: (context, state) => ReviewsListener.handle(context, state),

      builder: (context, state) {
        return ReviewsBuilder.build(
          context,
          state,
          widget.productId,
          _userIdFuture,
        );
      },
    );
  }
}