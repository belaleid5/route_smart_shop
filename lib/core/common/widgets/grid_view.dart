import 'dart:async';
import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/loading_widget.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class PaginatedGridView<T> extends StatefulWidget {

  const PaginatedGridView({
    super.key,
    this.itemCount = 0,
    required this.itemBuilder,
    this.isLoading = false,
    this.showScrollToTop = false,
    this.hasMore = true,
    this.reverse = false,
    this.loadMore,
    this.physics,
    this.refreshCallback,
    this.loadingWidget,
    this.shrinkWrap = false,
    this.preloadThreshold = 200.0,
    this.padding = EdgeInsets.zero,
    this.crossAxisCount,
    this.height,
    this.mainAxisSpacing = 8.0,
    this.crossAxisSpacing = 8.0,
  });
  final int itemCount;
  final EdgeInsets padding;
  final IndexedWidgetBuilder itemBuilder;
  final bool isLoading;
  final bool hasMore;
  final ScrollPhysics? physics;
  final VoidCallback? loadMore;
  final bool showScrollToTop;
  final bool reverse;
  final Future<void> Function()? refreshCallback;
  final Widget? loadingWidget;
  final double preloadThreshold;
  final int? crossAxisCount;
  final double mainAxisSpacing;
  final double? height;
  final double crossAxisSpacing;
  final bool shrinkWrap;

  @override
  State<PaginatedGridView<dynamic>> createState() => _PaginatedGridViewState();
}

class _PaginatedGridViewState extends State<PaginatedGridView<dynamic>> {
  final _controller = ScrollController();
  Timer? _debounceTimer;
  bool internalShowScrollToTop = false;

  void _scrollListener() {
    if (skipPagination) return;

    if (!_controller.hasClients) return;
    if (widget.showScrollToTop) {
      setState(() {
        internalShowScrollToTop = _controller.offset > 200;
      });
    }
    if (_controller.offset >=
            _controller.position.maxScrollExtent - widget.preloadThreshold &&
        !_controller.position.outOfRange) {
      if (_debounceTimer?.isActive ?? false) return;

      _debounceTimer = Timer(const Duration(milliseconds: 300), () {
        widget.loadMore?.call();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkInitialFill());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkInitialFill());
  }

  @override
  void didUpdateWidget(covariant PaginatedGridView oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkInitialFill());
  }

  bool get skipPagination => widget.isLoading || !widget.hasMore;

  void _checkInitialFill() {
    if (skipPagination) return;

    if (_controller.position.maxScrollExtent == 0) {
      widget.loadMore?.call();
    }
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gridView = Stack(
      children: [
        CustomGridView(
          controller: _controller,
          itemCount: widget.itemCount,
          padding: widget.padding,
          hasMore: widget.hasMore,
          itemBuilder: widget.itemBuilder,
          loadingWidget: widget.loadingWidget,
          crossAxisCount: widget.crossAxisCount,
          mainAxisSpacing: widget.mainAxisSpacing,
          crossAxisSpacing: widget.crossAxisSpacing,
          physics: widget.physics,
          reverse: widget.reverse,
          shrinkWrap: widget.shrinkWrap,
          height: widget.height,
        ),
        if (widget.showScrollToTop && internalShowScrollToTop)
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              backgroundColor: context.color.primary,
              onPressed: () => _controller.animateTo(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              ),
              child: const Icon(Icons.arrow_upward, color: Colors.white),
            ),
          ),
      ],
    );

    if (widget.itemCount == 0 && !widget.isLoading) {
      return widget.refreshCallback != null
          ? SafeArea(
              child: RefreshIndicator(
                key: Key('_ux1'),
                color: context.color.white,
                backgroundColor: context.color.primary,
                onRefresh: widget.refreshCallback!,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: SizedBox(),
                  ),
                ),
              ),
            )
          : SizedBox();
    }
    return widget.refreshCallback != null
        ? SafeArea(
            child: RefreshIndicator(
              key: Key('_ux2'),
              color: context.color.white,
              backgroundColor: context.color.primary,
              onRefresh: widget.refreshCallback!,
              child: gridView,
            ),
          )
        : gridView;
  }
}

class CustomGridView extends StatelessWidget {
  final ScrollController controller;
  final int itemCount;
  final bool hasMore;
  final IndexedWidgetBuilder itemBuilder;
  final Widget? loadingWidget;
  final int? crossAxisCount;
  final double? mainAxisSpacing;
  final double? crossAxisSpacing;
  final double? height;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final bool reverse;
  final EdgeInsets padding;

  const CustomGridView({
    super.key,
    required this.controller,
    required this.itemCount,
    required this.hasMore,
    required this.itemBuilder,
    this.loadingWidget,
    this.crossAxisCount,
    this.height,
    this.mainAxisSpacing,
    this.crossAxisSpacing,
    this.shrinkWrap = false,
    this.physics,
    this.reverse = false,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      shrinkWrap: shrinkWrap,
      padding: padding,
      reverse: reverse,
      physics: physics ?? BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount ?? 2,
        mainAxisSpacing: mainAxisSpacing ?? 10.0,
        crossAxisSpacing: crossAxisSpacing ?? 10.0,
        childAspectRatio: height != null ? (1 / height!) : 1,
      ),

      itemBuilder: (context, index) {
        if (index < itemCount) {
          return itemBuilder(context, index);
        }

        return loadingWidget ?? Center(child: LoadingWidget(size: 15));
      },
      itemCount: itemCount + (hasMore ? 1 : 0),
    );
  }
}
