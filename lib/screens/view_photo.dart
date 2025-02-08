import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ViewPhotoScreen extends StatelessWidget {
  final String imageUrl;
  final String heroTag;

  const ViewPhotoScreen({
    required this.imageUrl,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Photo'),
      ),
      body: Hero(
        tag: heroTag, // Use the same tag as in PetCard
        child: PhotoView(
          imageProvider: NetworkImage(imageUrl),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * 2,
        ),
      ),
    );
  }
}