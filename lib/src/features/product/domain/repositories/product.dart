import 'package:dartz/dartz.dart';
import 'package:tasck_clean_architecture/core/error/failure.dart';
import 'package:tasck_clean_architecture/src/features/product/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> fetchProducts(int current);
}
