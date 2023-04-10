import 'package:bloc/bloc.dart';
import 'package:stylish/data/product.dart';
import 'package:stylish/repo/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepo;

  ProductBloc(this.productRepo) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
        var data = await productRepo.getProduct();
        emit(ProductSuccessState(data));
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
    });
  }
}
