part of 'product_detail_select_bloc.dart';

abstract class ProductDetailSelectState {
  int colorIndex;
  int sizeIndex;
  int count;

  ProductDetailSelectState(this.colorIndex, this.sizeIndex, this.count);
}

class ProductDetailSelectInitial extends ProductDetailSelectState {
  ProductDetailSelectInitial(int colorIndex, int sizeIndex, int count)
      : super(colorIndex, sizeIndex, count);
}

class SelectState extends ProductDetailSelectState {
  SelectState(int colorIndex, int sizeIndex, int count)
      : super(colorIndex, sizeIndex, count);
}

class ComfirmState extends ProductDetailSelectState {
  ComfirmState(int colorIndex, int sizeIndex, int count)
      : super(colorIndex, sizeIndex, count);
}
