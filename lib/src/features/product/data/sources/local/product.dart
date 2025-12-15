import 'package:dartz/dartz.dart';
import 'package:tasck_clean_architecture/core/db_helper.dart';
import 'package:tasck_clean_architecture/src/features/product/data/models/product.dart';

abstract class ProductLocalService {
  Future<List<ProductModel>> getProducts();
  Future<Unit> cacheProducts(List<ProductModel> products);
}

class ProductLocalServiceImpl implements ProductLocalService {
  final DatabaseHelper databaseHelper;

  ProductLocalServiceImpl({required this.databaseHelper});

  @override
  Future<List<ProductModel>> getProducts() async {
    final userMaps = await databaseHelper.queryAll('product');

    return userMaps
        .map((productJson) => ProductModel.fromJson(productJson))
        .toList();
  }

  @override
  Future<Unit> cacheProducts(List<ProductModel> products) async {
    products.forEach((p) async {
      await databaseHelper.insert(p.toJson(), "product");
    });
    return Future.value(unit);

    // throw UnimplementedError();
  }
}
