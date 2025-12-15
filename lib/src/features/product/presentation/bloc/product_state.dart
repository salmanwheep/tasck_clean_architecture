part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductError extends ProductState {
  final String message;
  ProductError({required this.message});
}

class ProductStateData extends ProductState {
  final List<ProductEntity> products;
  ProductStateData({required this.products});
}

final class ProductLoaded extends ProductStateData {
  ProductLoaded({required super.products});
}

final class ProductLoadedGridView extends ProductStateData {
  ProductLoadedGridView({required super.products});
}

final class ProductLoadedListView extends ProductStateData {
  ProductLoadedListView({required super.products});
}
