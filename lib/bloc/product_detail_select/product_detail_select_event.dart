part of 'product_detail_select_bloc.dart';

abstract class ProductDetailSelectEvent {}

class ColorSelectEvent extends ProductDetailSelectEvent {
  Product productDetail;
  int colorIndex;
  ColorSelectEvent({required this.productDetail, required this.colorIndex});
}

class SizeSelectEvent extends ProductDetailSelectEvent {
  Product productDetail;
  int sizeIndex;
  SizeSelectEvent({required this.productDetail, required this.sizeIndex});
}

class IncrementCountEvent extends ProductDetailSelectEvent {
  Product productDetail;

  IncrementCountEvent({required this.productDetail});
}

class DecrementCountEvent extends ProductDetailSelectEvent {
  Product productDetail;

  DecrementCountEvent({required this.productDetail});
}

class ComfirmEvent extends ProductDetailSelectEvent {}
