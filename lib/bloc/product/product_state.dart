part of 'product_bloc.dart';

abstract class ProductState {
  List<Product>? productList;

  ProductState(this.productList);
}

class ProductInitial extends ProductState {
  ProductInitial() : super(null);
}

class ProductLoadingState extends ProductState {
  ProductLoadingState() : super(null);
}

class ProductSuccessState extends ProductState {
  ProductSuccessState(List<Product> productList) : super(productList);
}

class ProductErrorState extends ProductState {
  String errorMsg = "";

  ProductErrorState(this.errorMsg) : super(null);
}
