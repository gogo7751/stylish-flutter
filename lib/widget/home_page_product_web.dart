import 'package:flutter/material.dart';
import 'package:stylish/data/product.dart';
import 'package:stylish/widget/home_page_product_phone.dart';
import 'dart:math';

class ProductListWeb extends StatelessWidget {
  final List<Product> productList = List<Product>.generate(20, (index) {
    return Product(
        id: "1234567",
        image: Image.asset("assets/images/dummy_01.jpg",
            height: 100, width: 80, fit: BoxFit.cover),
        title: "UNIQLO 特級輕羽絨外套",
        price: "NT\$ 239");
  });

  ProductListWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Category(
          category: "女裝",
          productList: productList,
          isflexible: true,
        )),
        Flexible(
            child: Category(
          category: "男裝",
          productList: productList,
          isflexible: true,
        )),
        Flexible(
            child: Category(
          category: "配件",
          productList: productList,
          isflexible: true,
        ))
      ],
    ));
  }
}
