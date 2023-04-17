import 'package:bloc/bloc.dart';
import 'package:stylish/data/product.dart';
import 'package:stylish/repo/product_repository.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final ProductRepository productRepo;

  ProductDetailBloc(this.productRepo) : super(ProductDetailInitial()) {
    on<ProductDetailLoadEvent>((event, emit) async {
      emit(ProductDetailLoadingState());
      try {
        var data = await productRepo.getProductDetail(event.productId);
        emit(ProductDetailSuccessState(data));
      } catch (e) {
        emit(ProductDetailErrorState(e.toString()));
      }
    });
    on<IncrementEvent>((event, emit) {
      final currentState = state;
      if (currentState is ProductDetailSuccessState) {
        emit(CountEventState(event.count++));
      }
    });
    on<DecrementEvent>((event, emit) {
      final currentState = state;
      if (currentState is ProductDetailSuccessState) {
        emit(CountEventState(event.count--));
      }
    });
    // on<SelectColorEvent>((event, emit) {});
    // on<SelectSizeEvent>((event, emit) {});
  }
}
