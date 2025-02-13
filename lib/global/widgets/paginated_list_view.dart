import 'package:flutter/material.dart';

class PaginatedListView extends StatefulWidget {
  final Function() onRefresh;
  final Function() onLoadMore;
  final Widget? Function(BuildContext, int) itemBuilder;
  final Widget Function(BuildContext, int) separatorBuilder;
  final int itemCount;
  final EdgeInsetsGeometry? padding;
  const PaginatedListView(
      {super.key,
      required this.onRefresh,
      required this.onLoadMore,
      required this.itemCount,
      required this.itemBuilder,
      required this.separatorBuilder,
      this.padding});

  @override
  State<PaginatedListView> createState() => _PaginatedListViewState();
}

class _PaginatedListViewState extends State<PaginatedListView> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreItems);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMoreItems() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // print('Load More Items');
      widget.onLoadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: widget.padding,
      controller: _scrollController,
      itemCount: widget.itemCount,
      itemBuilder: widget.itemBuilder,
      separatorBuilder: widget.separatorBuilder,
    );
  }
}
