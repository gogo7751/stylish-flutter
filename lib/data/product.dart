import 'package:flutter/material.dart';

class ImageList {
  final Image image;

  ImageList({required this.image});
}

class ProductMaterial {
  final String material;
  final double percent;

  ProductMaterial({required this.material, required this.percent});
}

class ProductDetail {
  final String id;
  final String title;
  final String price;
  final List<Map<String, String>> colors;
  final List<Map<String, String>> sizes;
  final List<ProductMaterial> productMaterial;
  final String thickness;
  final String flexible;
  final String materialOrigin;
  final String processingOrigin;
  final String detail;
  final String homeImage;
  final List<String> images;

  ProductDetail(
      {required this.title,
      required this.id,
      required this.price,
      required this.colors,
      required this.sizes,
      required this.productMaterial,
      required this.thickness,
      required this.flexible,
      required this.materialOrigin,
      required this.processingOrigin,
      required this.detail,
      required this.homeImage,
      required this.images});
}

class Product {
  final Image image;
  final String id;
  final String title;
  final String price;

  Product({
    required this.image,
    required this.title,
    required this.id,
    required this.price,
  });
}
