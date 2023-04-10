import 'package:flutter/material.dart';
import 'package:stylish/widget/home_page_product_phone.dart';
import 'package:stylish/bloc/product/product_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListWeb extends StatelessWidget {
  const ProductListWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      if (state is ProductLoadingState) {
        return const CircularProgressIndicator();
      }
      if (state is ProductSuccessState) {
        return Flexible(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                child: Category(
              category: "女裝",
              productList: state.productList!,
              isflexible: true,
            )),
            Flexible(
                child: Category(
              category: "男裝",
              productList: state.productList!,
              isflexible: true,
            )),
            Flexible(
                child: Category(
              category: "配件",
              productList: state.productList!,
              isflexible: true,
            ))
          ],
        ));
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
