import 'package:flutter/material.dart';

class PaginatedGridView extends StatefulWidget {
  final Function() onRefresh;
  final Function() onLoadMore;
  final Widget? Function(BuildContext, int) itemBuilder;
  final int itemCount;
  const PaginatedGridView(
      {super.key,
      required this.onRefresh,
      required this.onLoadMore,
      required this.itemCount,
      required this.itemBuilder});

  @override
  State<PaginatedGridView> createState() => _PaginatedGridViewState();
}

class _PaginatedGridViewState extends State<PaginatedGridView> {
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
    return GridView.builder(
      // controller: _scrollController,
      // itemCount: widget.itemCount,
      // itemBuilder: widget.itemBuilder,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: widget.itemBuilder,
      itemCount: widget.itemCount,
      controller: _scrollController,
    );
  }
}
