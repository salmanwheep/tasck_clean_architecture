part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

final class FetchProduct extends ProductEvent {
  final int current;
  FetchProduct({required this.current});
}

final class RefreshProduct extends ProductEvent {}

final class SwichedProduct extends ProductEvent {
  final bool isList;
  final List<ProductEntity> products;
  SwichedProduct({required this.isList, required this.products});
}
