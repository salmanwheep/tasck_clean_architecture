import 'package:dartz/dartz.dart';
import 'package:tasck_clean_architecture/core/error/failure.dart';
import 'package:tasck_clean_architecture/src/features/product/domain/entities/product.dart';

import '../repositories/product.dart';

class FetchProductsUseCase {
  final ProductRepository _repository;

  FetchProductsUseCase(this._repository);
  Future<Either<Failure, List<ProductEntity>>> execute(int current) async {
    return await _repository.fetchProducts(current);
  }
}
