import 'package:flutter/material.dart';
import 'package:mechtronz/constants/constants.dart';

class Screen extends StatefulWidget {
  final Widget child;
  final Widget? footer;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final EdgeInsets? padding;
  final Drawer? drawer;
  final Key? uniqueKey;
  final Function(bool, Object?)? onPopInvokedWithResult;
  final bool canPop;
  const Screen({
    super.key,
    this.uniqueKey,
    required this.child,
    this.padding,
    this.footer,
    this.drawer,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.onPopInvokedWithResult,
    this.canPop = true,
  });

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: widget.canPop,
      onPopInvokedWithResult: widget.onPopInvokedWithResult,
      child: Scaffold(
        key: widget.uniqueKey,
        drawer: widget.drawer,
        floatingActionButton: widget.floatingActionButton,
        floatingActionButtonLocation: widget.floatingActionButtonLocation,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: widget.padding ?? kHPadding,
                  child: widget.child,
                ),
              ),
              if (widget.footer != null) widget.footer!,
            ],
          ),
        ),
      ),
    );
  }
}
