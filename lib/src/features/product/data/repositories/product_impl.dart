import 'package:dartz/dartz.dart';
import 'package:tasck_clean_architecture/core/error/exception.dart';
import 'package:tasck_clean_architecture/core/error/failure.dart';
import 'package:tasck_clean_architecture/core/network/network_info.dart';
import 'package:tasck_clean_architecture/src/features/product/domain/entities/product.dart';

import '../../domain/repositories/product.dart';
import '../../data/sources/local/product.dart';
import '../../data/sources/remote/product.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalService _localService;
  final ProductRemoteService _remoteService;
  final NetworkInfo _networkInfo;
  ProductRepositoryImpl(
    this._localService,
    this._remoteService,
    this._networkInfo,
  );
  @override
  Future<Either<Failure, List<ProductEntity>>> fetchProducts(
    int current,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final cache = await _remoteService.getProducts(current);
        _localService.cacheProducts(cache);
        return Right(cache);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        return Right(await _localService.getProducts());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
