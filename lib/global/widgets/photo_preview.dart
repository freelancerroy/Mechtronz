import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mechtronz/constants/app_colors.dart';
import 'package:mechtronz/constants/constants.dart';
import 'package:mechtronz/global/widgets/header.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoPreview extends StatefulWidget {
  final List<File>? assetImages;
  final List<String>? networkImages;
  final int initalIndex;
  const PhotoPreview(
      {super.key,
      this.assetImages,
      required this.initalIndex,
      this.networkImages});

  @override
  State<PhotoPreview> createState() => _PhotoPreviewState();
}

class _PhotoPreviewState extends State<PhotoPreview> {
  late PageController _pageController;
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: widget.initalIndex);
    setState(() {
      currentIndex = widget.initalIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.white,
        child: Column(
          children: [
            Padding(
                padding: kHPadding,
                child: Header(
                    title:
                        'Preview (${currentIndex + 1}/${widget.assetImages?.length ?? widget.networkImages?.length})')),
            Expanded(
              child: PhotoViewGallery.builder(
                scrollPhysics: const BouncingScrollPhysics(),
                builder: (BuildContext context, int index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: widget.assetImages?[index].path == null
                        ? NetworkImage(widget.networkImages?[index] ?? '')
                        : AssetImage(widget.assetImages?[index].path ?? ''),
                    initialScale: PhotoViewComputedScale.contained * 0.9,
                    heroAttributes: PhotoViewHeroAttributes(
                        tag: widget.assetImages?[index].path ?? ''),
                  );
                },
                itemCount:
                    widget.assetImages?.length ?? widget.networkImages?.length,
                pageController: _pageController,
                loadingBuilder: (context, event) => Center(
                  child: SizedBox(
                    width: 20.0,
                    height: 20.0,
                    child: CircularProgressIndicator(
                      value: event == null
                          ? 0
                          : event.cumulativeBytesLoaded /
                              event.expectedTotalBytes!,
                    ),
                  ),
                ),
                // backgroundDecoration: widget.backgroundDecoration,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
