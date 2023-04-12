import 'package:flutter/material.dart';
import 'dart:math';

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

class Hots {
  final String title;
  final List<Product> products;

  Hots({required this.title, required this.products});

  factory Hots.fromJson(Map<String, dynamic> json) {
    List<Product> products = [];
    for (var productsJson in json['products']) {
      products.add(Product.fromJson(productsJson));
    }
    return Hots(
      title: json['title'],
      products: products,
    );
  }
}

class Product {
  final int id;
  final String category;
  final String title;
  final String description;
  final int price;
  final String texture;
  final String wash;
  final String place;
  final String note;
  final String story;
  final List<StylishColor> colors;
  final List<String> sizes;
  final List<Variant> variants;
  final String mainImage;
  final List<String> images;

  Product({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.price,
    required this.texture,
    required this.wash,
    required this.place,
    required this.note,
    required this.story,
    required this.colors,
    required this.sizes,
    required this.variants,
    required this.mainImage,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    List<StylishColor> colors = [];
    for (var colorJson in json['colors']) {
      colors.add(StylishColor.fromJson(colorJson));
    }

    List<Variant> variants = [];
    for (var variantJson in json['variants']) {
      variants.add(Variant.fromJson(variantJson));
    }

    return Product(
      id: json['id'],
      category: json['category'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      texture: json['texture'],
      wash: json['wash'],
      place: json['place'],
      note: json['note'],
      story: json['story'],
      colors: colors,
      sizes: List<String>.from(json['sizes']),
      variants: variants,
      mainImage: json['main_image'],
      images: List<String>.from(json['images']),
    );
  }
}

class StylishColor {
  final String code;
  final String name;

  StylishColor({
    required this.code,
    required this.name,
  });

  factory StylishColor.fromJson(Map<String, dynamic> json) {
    return StylishColor(
      code: json['code'],
      name: json['name'],
    );
  }
}

class Variant {
  final String colorCode;
  final String size;
  final int stock;

  Variant({
    required this.colorCode,
    required this.size,
    required this.stock,
  });

  factory Variant.fromJson(Map<String, dynamic> json) {
    return Variant(
      colorCode: json['color_code'],
      size: json['size'],
      stock: json['stock'],
    );
  }
}

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
