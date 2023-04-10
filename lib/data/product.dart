import 'package:flutter/material.dart';
import 'dart:math';

class ImageList {
  late Image image;

  ImageList({required this.image});
}

class ProductMaterial {
  late String material;
  late double percent;

  ProductMaterial({required this.material, required this.percent});
}

class ProductDetail {
  late String id;
  late String title;
  late String price;
  late Map<String, Map<String, int>> variant;
  late List<ProductMaterial> productMaterial;
  late String thickness;
  late String flexible;
  late String materialOrigin;
  late String processingOrigin;
  late String detail;
  late String homeImage;
  late List<String> images;

  ProductDetail(
      {required this.title,
      required this.id,
      required this.price,
      required this.variant,
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
  late Image image;
  late String id;
  late String title;
  late String price;

  Product({
    required this.image,
    required this.title,
    required this.id,
    required this.price,
  });
}

final List<Product> productList = List<Product>.generate(20, (index) {
  return Product(
      id: "1234567",
      image: Image.asset("assets/images/dummy_0${Random().nextInt(3) + 1}.jpg",
          height: 100, width: 80, fit: BoxFit.cover),
      title: "UNIQLO 特級輕羽絨外套",
      price: "NT\$ 239");
});

final List<ImageList> bannerList = List<ImageList>.generate(20, (index) {
  return ImageList(
      image: Image.asset("assets/images/banner_0${Random().nextInt(4) + 1}.jpg",
          height: 200, width: 400, fit: BoxFit.cover));
});

final productDetail = ProductDetail(
    id: "1234567",
    title: "UNIQLO 特級輕羽絨外套",
    price: "239",
    variant: {
      '0xFFFF0000': {'S': 10, 'M': 15, 'L': 20},
      '0xFF00FF00': {'S': 5, 'M': 10, 'L': 15},
      '0xFF00FFFF': {'M': 10, 'L': 20}
    },
    productMaterial: [
      ProductMaterial(material: '棉', percent: 0.8),
      ProductMaterial(material: '聚酯纖維', percent: 0.2)
    ],
    thickness: "薄",
    flexible: "無",
    materialOrigin: "中國",
    processingOrigin: "日本",
    detail:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vel sapien sed urna fringilla pulvinar. Vivamus et nulla eu felis tincidunt tristique. Ut nec nibh id velit ullamcorper iaculis. Sed consectetur, metus eu dapibus aliquet, risus augue interdum orci, non efficitur mi tortor ac dolor. Maecenas euismod vehicula mauris, sit amet eleifend enim. Proin tristique malesuada nunc, vel euismod ipsum pulvinar sit amet. Phasellus hendrerit laoreet quam quis rhoncus. Fusce fringilla sapien a tellus convallis bibendum. Duis in quam ipsum. Proin vel turpis nec nulla lacinia tristique id sed erat.",
    homeImage: "assets/images/dummy_02.jpg",
    images: [
      "assets/images/banner_01.jpg",
      "assets/images/banner_02.jpg",
      "assets/images/banner_03.jpg"
    ]);
