part of 'product_detail_bloc.dart';

abstract class ProductDetailEvent {}

class ProductDetailLoadEvent extends ProductDetailEvent {
  int productId;

  ProductDetailLoadEvent({required this.productId});
}
