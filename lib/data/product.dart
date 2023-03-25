import 'package:flutter/material.dart';

class ImageList {
  final Image image;

  ImageList({required this.image});
}

class Product {
  final Image image;
  final String title;
  final String price;

  Product({required this.image, required this.title, required this.price});
}
