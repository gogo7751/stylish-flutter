part of 'product_detail_bloc.dart';

abstract class ProductDetailEvent {}

class ProductDetailLoadEvent extends ProductDetailEvent {
  String productId;

  ProductDetailLoadEvent({required this.productId});
}
