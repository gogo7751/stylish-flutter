part of 'cart_bloc.dart';

abstract class CartState {
  List<DBProduct>? dbProductList;

  CartState(this.dbProductList);
}

class CartInitial extends CartState {
  CartInitial() : super(null);
}

class CartLoadingState extends CartState {
  CartLoadingState() : super(null);
}

class CartSuccessState extends CartState {
  CartSuccessState(List<DBProduct> productList) : super(productList);
}

class CartErrorState extends CartState {
  String errorMsg = "";

  CartErrorState(this.errorMsg) : super(null);
}
