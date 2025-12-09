import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<FetchProduct>((event, emit) async {
      emit(ProductLoading());
      await Future.delayed(Duration(seconds: 1));
      emit(ProductLoaded(data: 'Sample data for Product'));
    });
  }
}