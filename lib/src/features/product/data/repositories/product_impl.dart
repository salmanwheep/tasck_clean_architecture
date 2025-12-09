import '../../domain/repositories/product.dart';
import '../../data/sources/local/product.dart';
import '../../data/sources/remote/product.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalService _localService;
  final ProductRemoteService _remoteService;

  ProductRepositoryImpl(this._localService, this._remoteService);
}