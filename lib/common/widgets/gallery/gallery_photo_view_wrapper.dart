import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../common.dart';

class GalleryPhotoViewWrapper extends StatelessWidget {
  GalleryPhotoViewWrapper({
    super.key,
    this.minScale,
    this.maxScale,
    this.loadingBuilder,
    this.initialIndex = 0,
    this.backgroundDecoration,
    required this.galleryItems,
    this.scrollDirection = Axis.horizontal,
  }) : pageController = PageController(initialPage: initialIndex);

  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  final List<String> galleryItems;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: const TAppBar(
          showBackArrow: true,
          backgroundColor: Colors.transparent,
          backArrowBackgroundColor: Colors.white,
        ),
        body: Container(
          decoration: backgroundDecoration,
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              PhotoViewGallery.builder(
                scrollPhysics: const BouncingScrollPhysics(),
                builder: _buildItem,
                itemCount: galleryItems.length,
                loadingBuilder: loadingBuilder,
                backgroundDecoration: backgroundDecoration,
                pageController: pageController,
                scrollDirection: scrollDirection,
              ),
            ],
          ),
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    String item = galleryItems[index];
    return PhotoViewGalleryPageOptions(
      imageProvider: CachedNetworkImageProvider(item),
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
      maxScale: PhotoViewComputedScale.covered * 4.1,
      heroAttributes: PhotoViewHeroAttributes(tag: index),
    );
  }
}
