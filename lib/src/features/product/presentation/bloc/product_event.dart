import 'package:equatable/equatable.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();
  @override
  List<Object?> get props => [];
}

final class FetchProduct extends ProductEvent {
  // final int current;
  const FetchProduct(
    // {required this.current}
  );
  @override
  List<Object?> get props => [
    // current
  ];
}

final class RefreshProduct extends ProductEvent {
  @override
  List<Object?> get props => [];
}

final class SwichedProduct extends ProductEvent {
  // final bool isList;
  // final List<ProductEntity> products;
  const SwichedProduct(
    // {required this.isList, required this.products}
  );

  @override
  List<Object?> get props => [
    // isList, products
  ];
}

final class LoadingMore extends ProductEvent {
  @override
  List<Object?> get props => [];
}
