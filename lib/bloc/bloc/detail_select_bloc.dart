import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'detail_select_event.dart';
part 'detail_select_state.dart';

class DetailSelectBloc extends Bloc<DetailSelectEvent, DetailSelectState> {
  DetailSelectBloc() : super(DetailSelectInitial()) {
    on<DetailSelectEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
