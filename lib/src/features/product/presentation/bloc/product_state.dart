part of 'product_bloc.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}
final class ProductLoading extends ProductState {}
final class ProductLoaded extends ProductState {
  final String data;
  ProductLoaded({required this.data});
}
final class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}