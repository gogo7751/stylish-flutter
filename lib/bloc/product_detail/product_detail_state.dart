part of 'product_detail_bloc.dart';

abstract class ProductDetailState {
  Product? productDetail;

  ProductDetailState(this.productDetail);
}

class ProductDetailInitial extends ProductDetailState {
  ProductDetailInitial() : super(null);
}

class ProductDetailLoadingState extends ProductDetailState {
  ProductDetailLoadingState() : super(null);
}

class ProductDetailSuccessState extends ProductDetailState {
  @override
  Product? productDetail;

  ProductDetailSuccessState(this.productDetail) : super(productDetail);
}

class ProductDetailErrorState extends ProductDetailState {
  String errorMsg = "";

  ProductDetailErrorState(this.errorMsg) : super(null);
}

class CountEventState extends ProductDetailState {
  int count;

  CountEventState(this.count) : super(null);
}
