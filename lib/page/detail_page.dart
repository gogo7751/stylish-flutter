import 'package:flutter/material.dart';
import 'package:stylish/widget/app_bar.dart';
import 'package:stylish/data/product.dart';
import 'package:stylish/widget/detail_top.dart';
import 'package:stylish/widget/detail_middle.dart';
import 'package:stylish/widget/detail_bottom.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.id});

  final String id;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    bool isLargeScreen = MediaQuery.of(context).size.width > 800;

    final productMaterial = ProductMaterial(material: "棉", percent: 1.0);
    final productDetail = ProductDetail(
        id: widget.id,
        title: "UNIQLO 特級輕羽絨外套",
        price: "239",
        colors: [
          "0xFFFF0000",
          "0xFF00FF00",
          "0xFF0000FF",
          "0xFFFFFF00",
          "0xFFFF00FF",
          "0xFF00FFFF"
        ],
        sizes: ["S", "M"],
        stock: "12",
        productMaterial: [productMaterial],
        thickness: "薄",
        flexible: "無",
        materialOrigin: "中國",
        processingOrigin: "日本",
        detail:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vel sapien sed urna fringilla pulvinar. Vivamus et nulla eu felis tincidunt tristique. Ut nec nibh id velit ullamcorper iaculis. Sed consectetur, metus eu dapibus aliquet, risus augue interdum orci, non efficitur mi tortor ac dolor. Maecenas euismod vehicula mauris, sit amet eleifend enim. Proin tristique malesuada nunc, vel euismod ipsum pulvinar sit amet. Phasellus hendrerit laoreet quam quis rhoncus. Fusce fringilla sapien a tellus convallis bibendum. Duis in quam ipsum. Proin vel turpis nec nulla lacinia tristique id sed erat.",
        homeImage: "assets/images/dummy_01.jpg",
        images: [
          "assets/images/dummy_01.jpg",
          "assets/images/dummy_01.jpg",
          "assets/images/dummy_01.jpg"
        ]);

    return Scaffold(
      appBar: const MyAppBar(),
      body: Center(
        child: Container(
          width: isLargeScreen ? 800 : MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: ListView(children: [
                    isLargeScreen
                        ? Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: AspectRatio(
                                          aspectRatio: 1 / 1,
                                          child: DetailTop(
                                              productDetail: productDetail)),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: DeatilMiddle(
                                      productDetail: productDetail,
                                      widget: widget,
                                    ),
                                  ),
                                ],
                              ),
                              DetailBottom(productDetail: productDetail),
                            ],
                          )
                        : Column(children: [
                            DetailTop(productDetail: productDetail),
                            DeatilMiddle(
                              productDetail: productDetail,
                              widget: widget,
                            ),
                            DetailBottom(productDetail: productDetail),
                          ]),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
