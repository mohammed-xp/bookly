import 'package:bookly/core/widgets/shimmer_loading_base.dart';
import 'package:flutter/material.dart';

class ImagePlaceHolder extends StatelessWidget {
  const ImagePlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 2.7 / 4,
      child: ShimmerLoadingBase(),
    );
  }
}
