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

class ProductLoaded extends ProductState {
  final bool isList;
  final bool isLoadMore;
  final List<ProductEntity> products;
  ProductLoaded({
    required this.products,
    required this.isList,
    required this.isLoadMore,
  });
  @override
  List<Object?> get props => [isList, isLoadMore, products];
}
