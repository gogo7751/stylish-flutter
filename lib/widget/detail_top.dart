import 'package:flutter/material.dart';
import 'package:stylish/data/product.dart';

class DetailTop extends StatelessWidget {
  const DetailTop({
    super.key,
    required this.productDetail,
  });

  final ProductDetail productDetail;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      productDetail.homeImage,
      fit: BoxFit.fill,
    );
  }
}
