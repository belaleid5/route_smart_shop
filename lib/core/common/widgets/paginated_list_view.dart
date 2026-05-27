import 'dart:async';
import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/widgets/loading_widget.dart';
import 'package:route_smart/core/common/widgets/smooth_list_view.dart';

class PaginatedListView<T> extends StatefulWidget {
  const PaginatedListView({
    super.key,
    this.itemCount = 0,
    required this.itemBuilder,
    this.isLoading = false,
    this.showScrollToTop = false,
    this.hasMore = true,
    this.shrinkWrap = false,
    this.isSmoothListView = true,
    this.reverse = false,
    this.scrollDirection = Axis.vertical,
    this.loadMore,
    this.physics,
    this.refreshCallback,
    this.loadingWidget,
    this.preloadThreshold = 200.0,
    this.padding = EdgeInsets.zero,
  });

  final int itemCount;
  final EdgeInsets padding;
  final IndexedWidgetBuilder itemBuilder;
  final bool isLoading, hasMore, showScrollToTop, shrinkWrap, isSmoothListView, reverse;
  final Axis scrollDirection;
  final ScrollPhysics? physics;
  final VoidCallback? loadMore;
  final Future<void> Function()? refreshCallback;
  final Widget? loadingWidget;
  final double preloadThreshold;

  @override
  State<PaginatedListView<dynamic>> createState() => _PaginatedListViewState();
}

class _PaginatedListViewState extends State<PaginatedListView<dynamic>> {
  final _controller = ScrollController();
  Timer? _debounceTimer;
  bool _showScrollToTop = false;

  void _scrollListener() {
    if (widget.isLoading || !widget.hasMore || !_controller.hasClients) return;
    if (widget.showScrollToTop) setState(() => _showScrollToTop = _controller.offset > 200);
    
    if (_controller.offset >= _controller.position.maxScrollExtent - widget.preloadThreshold) {
      if (_debounceTimer?.isActive ?? false) return;
      _debounceTimer = Timer(const Duration(milliseconds: 300), () => widget.loadMore?.call());
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkInitialFill());
  }

  void _checkInitialFill() {
    if (widget.isLoading || !widget.hasMore || !_controller.hasClients) return;
    if (_controller.position.maxScrollExtent == 0) widget.loadMore?.call();
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
    final listView = Stack(children: [
      CustomListView(
        controller: _controller,
        itemCount: widget.itemCount,
        shrinkWrap: widget.shrinkWrap,
        padding: widget.padding,
        hasMore: widget.hasMore,
        itemBuilder: widget.itemBuilder,
        loadingWidget: widget.loadingWidget,
        isSmoothListView: widget.isSmoothListView,
        physics: widget.physics,
        reverse: widget.reverse,
        scrollDirection: widget.scrollDirection,
      ),
      if (widget.showScrollToTop && _showScrollToTop)
        Positioned(
          bottom: 16, right: 16,
          child: FloatingActionButton(
            backgroundColor: context.colors.primary, // ✅ Fixed
            onPressed: () => _controller.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut),
            child: const Icon(Icons.arrow_upward, color: Colors.white),
          ),
        ),
    ]);

    if (widget.itemCount == 0 && !widget.isLoading) {
      return widget.refreshCallback != null
          ? RefreshIndicator(color: context.colors.white, backgroundColor: context.colors.primary, onRefresh: widget.refreshCallback!, child: ListView(physics: const AlwaysScrollableScrollPhysics(), children: [SizedBox(height: MediaQuery.of(context).size.height * 0.5)]))
          : const SizedBox.shrink();
    }

    return widget.refreshCallback != null
        ? RefreshIndicator(color: context.colors.white, backgroundColor: context.colors.primary, onRefresh: widget.refreshCallback!, child: listView)
        : listView;
  }
}

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key, required this.controller, required this.itemCount, required this.hasMore,
    required this.itemBuilder, required this.scrollDirection, this.loadingWidget,
    this.reverse = false, this.shrinkWrap = false, this.physics, required this.isSmoothListView,
    this.padding = EdgeInsets.zero,
  });

  final ScrollController controller;
  final int itemCount;
  final bool hasMore, reverse, shrinkWrap, isSmoothListView;
  final IndexedWidgetBuilder itemBuilder;
  final Widget? loadingWidget;
  final Axis scrollDirection;
  final ScrollPhysics? physics;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final loader = loadingWidget ?? const Center(child: LoadingWidget(size: 20));
    return isSmoothListView
        ? SmoothListView.builder(
            padding: padding, reverse: reverse, controller: controller, scrollDirection: scrollDirection,
            duration: const Duration(milliseconds: 500),
            itemBuilder: (context, index) => index < itemCount ? itemBuilder(context, index) : loader,
            itemCount: itemCount + (hasMore ? 1 : 0),
          )
        : ListView.builder(
            reverse: reverse, controller: controller, physics: physics, shrinkWrap: shrinkWrap,
            padding: padding, scrollDirection: scrollDirection,
            itemBuilder: (context, index) => index < itemCount ? itemBuilder(context, index) : loader,
            itemCount: itemCount + (hasMore ? 1 : 0),
          );
  }
}