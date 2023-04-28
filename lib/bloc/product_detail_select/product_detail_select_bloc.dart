import 'package:bloc/bloc.dart';
import 'package:stylish/data/product.dart';
part 'product_detail_select_event.dart';
part 'product_detail_select_state.dart';

class ProductDetailSelectBloc
    extends Bloc<ProductDetailSelectEvent, ProductDetailSelectState> {
  ProductDetailSelectBloc() : super(ProductDetailSelectInitial(0, 0, 0)) {
    on<ColorSelectEvent>((event, emit) {
      int stock = event.productDetail.variants
          .firstWhere(
            (variant) =>
                variant.colorCode ==
                    event.productDetail.colors[event.colorIndex].code &&
                variant.size == event.productDetail.sizes[state.sizeIndex],
          )
          .stock;
      emit(SelectState(event.colorIndex, state.sizeIndex, stock == 0 ? 0 : 1));
    });
    on<SizeSelectEvent>((event, emit) {
      int stock = event.productDetail.variants
          .firstWhere(
            (variant) =>
                variant.colorCode ==
                    event.productDetail.colors[state.colorIndex].code &&
                variant.size == event.productDetail.sizes[event.sizeIndex],
          )
          .stock;
      emit(SelectState(state.colorIndex, event.sizeIndex, stock == 0 ? 0 : 1));
    });
    on<IncrementCountEvent>((event, emit) {
      int stock = event.productDetail.variants
          .firstWhere(
            (variant) =>
                variant.colorCode ==
                    event.productDetail.colors[state.colorIndex].code &&
                variant.size == event.productDetail.sizes[state.sizeIndex],
          )
          .stock;
      if (stock == 0) {
        emit(SelectState(state.colorIndex, state.sizeIndex, 0));
      } else if (state.count < stock) {
        int newCount = state.count + 1;
        emit(SelectState(state.colorIndex, state.sizeIndex, newCount));
      } else {
        emit(SelectState(state.colorIndex, state.sizeIndex, stock));
      }
    });
    on<DecrementCountEvent>((event, emit) {
      int stock = event.productDetail.variants
          .firstWhere(
            (variant) =>
                variant.colorCode ==
                    event.productDetail.colors[state.colorIndex].code &&
                variant.size == event.productDetail.sizes[state.sizeIndex],
          )
          .stock;
      if (stock == 0) {
        emit(SelectState(state.colorIndex, state.sizeIndex, 0));
      } else if (state.count == 1) {
        emit(SelectState(state.colorIndex, state.sizeIndex, 1));
      } else {
        int newCount = state.count - 1;
        emit(SelectState(state.colorIndex, state.sizeIndex, newCount));
      }
    });
    on<ComfirmEvent>((event, emit) {
      if (state.count == 0) {
        emit(ComfirmState(state.colorIndex, state.sizeIndex, state.count));
      } else {
        // 加入DB
        emit(ComfirmState(state.colorIndex, state.sizeIndex, state.count));
      }
    });
  }
}
