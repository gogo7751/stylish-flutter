part of 'product_detail_bloc.dart';

abstract class ProductDetailState {
  ProductDetail? productDetail;

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
  ProductDetail? productDetail;

  ProductDetailSuccessState(this.productDetail) : super(productDetail);
}

class ProductDetailErrorState extends ProductDetailState {
  String errorMsg = "";

  ProductDetailErrorState(this.errorMsg) : super(null);
}
