import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImagePreviewPage extends StatelessWidget {
  final List<dynamic> images;
  final int initialIndex;

  ImagePreviewPage({Key? key, required this.images, this.initialIndex = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: PhotoViewGallery.builder(
          itemCount: images.length,
          builder: (context, index) {
            // Placeholder image provider for unsupported image types
            ImageProvider placeholderProvider =
                AssetImage('assets/placeholder.png');

            // Check if the image is a file or a URL
            if (images[index] is File) {
              // If it's a file, use FileImage
              return PhotoViewGalleryPageOptions(
                imageProvider: FileImage(images[index] as File),
                initialScale: PhotoViewComputedScale.contained * 0.8,
                minScale: PhotoViewComputedScale.contained * 0.8,
                maxScale: PhotoViewComputedScale.covered * 2,
              );
            } else if (images[index] is String) {
              // If it's a URL, use CachedNetworkImage
              return PhotoViewGalleryPageOptions(
                imageProvider:
                    CachedNetworkImageProvider(images[index] as String),
                initialScale: PhotoViewComputedScale.contained * 0.8,
                minScale: PhotoViewComputedScale.contained * 0.8,
                maxScale: PhotoViewComputedScale.covered * 2,
              );
            } else {
              // Handle unsupported image types here by using the placeholder provider
              return PhotoViewGalleryPageOptions(
                imageProvider: placeholderProvider,
                initialScale: PhotoViewComputedScale.contained * 0.8,
                minScale: PhotoViewComputedScale.contained * 0.8,
                maxScale: PhotoViewComputedScale.covered * 2,
              );
            }
          },
          scrollPhysics: BouncingScrollPhysics(),
          pageController: PageController(initialPage: initialIndex),
        ),
      ),
    );
  }
}
