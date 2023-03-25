import 'package:flutter/material.dart';
import 'package:stylish/data/product.dart';

class BannerList extends StatelessWidget {
  final List<ImageList> listItems = List<ImageList>.generate(20, (index) {
    return ImageList(
        image: Image.asset("assets/images/dummy_01.jpg",
            height: 200, width: 400, fit: BoxFit.cover));
  });

  BannerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              width: 250.0,
              margin: const EdgeInsets.only(
                  top: 20, bottom: 10, left: 10, right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: listItems[index].image,
              ));
        },
      ),
    );
  }
}
