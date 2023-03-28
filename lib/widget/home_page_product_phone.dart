import 'package:flutter/material.dart';
import 'package:stylish/data/product.dart';

class Category extends StatefulWidget {
  const Category({
    Key? key,
    required this.category,
    required this.productList,
    required this.isflexible,
  }) : super(key: key);

  final String category;
  final List<Product> productList;
  final bool isflexible;

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool _isVisible = false;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isflexible) {
      return Column(
        children: [
          Text(widget.category),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              itemCount: widget.productList.length,
              itemBuilder: (BuildContext context, int index) {
                return ProdcutItem(item: widget.productList[index]);
              },
            ),
          )
        ],
      );
    } else {
      return Column(
        children: [
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black),
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: _toggleVisibility,
            child: Text(widget.category),
          ),
          Visibility(
            visible: _isVisible,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.productList.length,
              itemBuilder: (BuildContext context, int index) {
                return ProdcutItem(item: widget.productList[index]);
              },
            ),
          ),
        ],
      );
    }
  }
}

class ProdcutItem extends StatelessWidget {
  const ProdcutItem({
    super.key,
    required this.item,
  });

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.black, width: 1.0)),
        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              child: item.image,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.title,
                ),
                Text(item.price),
              ],
            ),
          ],
        ));
  }
}

class ProductListPhone extends StatelessWidget {
  final List<Product> productList = List<Product>.generate(20, (index) {
    return Product(
        image: Image.asset("assets/images/dummy_01.jpg",
            height: 100, width: 80, fit: BoxFit.cover),
        title: "UNIQLO 特級輕羽絨外套",
        price: "NT\$ 239");
  });

  ProductListPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Category(category: "女裝", productList: productList, isflexible: false),
          Category(category: "男裝", productList: productList, isflexible: false),
          Category(category: "配件", productList: productList, isflexible: false)
        ],
      ),
    ));
  }
}
