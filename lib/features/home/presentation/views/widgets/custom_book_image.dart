import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/image_place_holder.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) {
            return const ImagePlaceHolder();
          },
          errorWidget: (context, url, error) {
            return const Icon(Icons.error_outline_rounded, size: 50,);
          },
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
