import 'package:flutter/material.dart';
import 'package:route_smart/features/search/presention/pages/search_screen.dart';

class SearchTabPage extends StatefulWidget {
  const SearchTabPage({super.key});

  @override
  State<SearchTabPage> createState() => _SearchTabPageState();
}

class _SearchTabPageState extends State<SearchTabPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const SearchScreen();
  }
}