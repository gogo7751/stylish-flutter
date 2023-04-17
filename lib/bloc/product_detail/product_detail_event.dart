part of 'product_detail_bloc.dart';

abstract class ProductDetailEvent {}

class ProductDetailLoadEvent extends ProductDetailEvent {
  int productId;

  ProductDetailLoadEvent({required this.productId});
}

class IncrementEvent extends ProductDetailEvent {
  int count;

  IncrementEvent({required this.count});
}

class DecrementEvent extends ProductDetailEvent {
  int count;

  DecrementEvent({required this.count});
}

class SelectColorEvent extends ProductDetailEvent {}

class SelectSizeEvent extends ProductDetailEvent {}
