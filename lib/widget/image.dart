import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MyImageWidget extends StatelessWidget {
  const MyImageWidget({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.fill,
    this.borderRadiusTopRight = 0,
    this.borderRadiusTopLeft = 0,
    this.borderRadiusBottomRight = 0,
    this.borderRadiusBottomLeft = 0,
  });

  final String imageUrl;
  final BoxFit fit;
  final double borderRadiusTopRight;
  final double borderRadiusTopLeft;
  final double borderRadiusBottomRight;
  final double borderRadiusBottomLeft;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(borderRadiusTopLeft),
        topRight: Radius.circular(borderRadiusTopRight),
        bottomLeft: Radius.circular(borderRadiusBottomLeft),
        bottomRight: Radius.circular(borderRadiusBottomRight),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        placeholder: (context, url) => Image.asset(
          'assets/images/ic_placeholder.png',
          fit: BoxFit.fill,
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
