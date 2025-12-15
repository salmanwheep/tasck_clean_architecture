import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasck_clean_architecture/core/error/failure.dart';
import 'package:tasck_clean_architecture/core/strings/failures.dart';
import 'package:tasck_clean_architecture/src/features/product/domain/entities/product.dart';
import 'package:tasck_clean_architecture/src/features/product/domain/use_cases/get_products.dart';
import 'package:tasck_clean_architecture/src/features/product/presentation/bloc/product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final FetchProductsUseCase fetchProduct;
  final List<ProductEntity> listData = [];

  ProductBloc({required this.fetchProduct}) : super(ProductInitial()) {
    on<FetchProduct>((event, emit) async {
      emit(ProductLoading());

      final products = await fetchProduct.execute(
        (state is ProductLoaded) ? (state as ProductLoaded).products.length : 0,
      );

      emit(_mapFailureToState(products));
    });
    on<RefreshProduct>((event, emit) async {
      emit(ProductLoading());
      final products = await fetchProduct.execute(0);
      emit(_mapFailureToState(products));
    });
    on<SwichedProduct>((event, emit) {
      if (state is ProductLoaded) {
        var currentState = state as ProductLoaded;

        emit(
          ProductLoaded(
            products: currentState.products,
            isList: !currentState.isList,
            isLoadMore: false,
          ),
        );
      }
    });
    on<LoadingMore>((event, emit) {
      if (state is ProductLoaded) {
        var currentState = state as ProductLoaded;

        emit(
          ProductLoaded(
            products: currentState.products,
            isList: !currentState.isList,
            isLoadMore: false,
          ),
        );
      }
    });
  }
  ProductState _mapFailureToState(Either<Failure, List<ProductEntity>> either) {
    return either.fold(
      (failure) => ProductError(message: _mapFailureToMessage(failure)),
      (product) {
        listData.addAll(product);
        if (state is ProductLoaded) {
          final currentState = state as ProductLoaded;
          return ProductLoaded(
            products: listData,
            isList: currentState.isList,
            isLoadMore: currentState.isLoadMore,
          );
        } else {
          return ProductLoaded(
            products: listData,
            isList: true,
            isLoadMore: false,
          );
        }
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure():
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure():
        return Cache_FAILURE_MESSAGE;
      case OfflineFailure():
        return OFFLINE_FAILURE_MESSAGE;

      // break;

      default:
        return "Unexpected Error , Please try again later ;";
    }
  }
}
