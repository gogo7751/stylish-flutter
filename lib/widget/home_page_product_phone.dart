import 'package:flutter/material.dart';
import 'package:stylish/bloc/product/product_bloc.dart';
import 'package:stylish/data/product.dart';
import 'package:stylish/page/detail_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  bool _isVisible = true;

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
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                itemCount: widget.productList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProdcutItem(item: widget.productList[index]);
                },
              ),
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
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailPage(id: item.id)),
          );
        },
        child: Container(
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.black, width: 1.0)),
            margin:
                const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
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
            )));
  }
}

class ProductListPhone extends StatelessWidget {
  const ProductListPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      if (state is ProductLoadingState) {
        return const CircularProgressIndicator();
      }
      if (state is ProductSuccessState) {
        return Expanded(
          child: ListView(
            // child: Column(
            children: [
              Category(
                  category: "女裝",
                  productList: state.productList!,
                  isflexible: false),
              Category(
                  category: "男裝",
                  productList: state.productList!,
                  isflexible: false),
              Category(
                  category: "配件",
                  productList: state.productList!,
                  isflexible: false)
            ],
          ),
          // ),
        );
      }
      if (state is ProductErrorState) {
        return Center(
          child: Text(state.errorMsg),
        );
      }
      return Container();
    });
  }
}
