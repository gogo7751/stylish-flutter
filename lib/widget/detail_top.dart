import 'package:flutter/material.dart';
import 'package:stylish/data/product.dart';
import 'package:stylish/widget/image.dart';

class DetailTop extends StatelessWidget {
  const DetailTop({
    super.key,
    required this.productDetail,
  });

  final Product productDetail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: MyImageWidget(
        imageUrl: productDetail.mainImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
