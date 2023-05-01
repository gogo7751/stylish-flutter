import 'package:bloc/bloc.dart';
import 'package:stylish/data/product.dart';
import 'package:stylish/data/db_product.dart';
import 'package:stylish/dataProvider/repo/stylish_repository.dart';
part 'product_detail_select_event.dart';
part 'product_detail_select_state.dart';

class ProductDetailSelectBloc
    extends Bloc<ProductDetailSelectEvent, ProductDetailSelectState> {
  final StylishRepository stylishRepo;
  ProductDetailSelectBloc(this.stylishRepo)
      : super(ProductDetailSelectInitial(0, 0, 0)) {
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
    on<ComfirmEvent>((event, emit) async {
      if (state.count > 0) {
        DBProduct product = DBProduct(
            id: null,
            productId: event.productDetail.id.toString(),
            imageUrl: event.productDetail.mainImage,
            name: event.productDetail.title,
            colorCode: event.productDetail.colors[state.colorIndex].code,
            size: event.productDetail.sizes[state.sizeIndex],
            count: state.count,
            price: event.productDetail.price);
        await stylishRepo.addToCart(product);
      }
    });
  }
}
