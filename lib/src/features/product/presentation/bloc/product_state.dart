part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ProductInitial extends ProductState {
  @override
  List<Object?> get props => [];
}

final class ProductLoading extends ProductState {
  @override
  List<Object?> get props => [];
}

final class ProductError extends ProductState {
  @override
  List<Object?> get props => [];

  ProductError({required this.message});
  final String message;
}

class ProductStateData extends ProductState {
  @override
  List<Object?> get props => [];

  final List<ProductEntity> products;
  ProductStateData({required this.products});
}

final class ProductLoaded extends ProductStateData {
  @override
  List<Object?> get props => [];

  ProductLoaded({required super.products});
}

final class ProductLoadedGridView extends ProductStateData {
  @override
  List<Object?> get props => [];

  ProductLoadedGridView({required super.products});
}

final class ProductLoadedListView extends ProductStateData {
  @override
  List<Object?> get props => [];

  ProductLoadedListView({required super.products});
}
