import 'dart:convert';

import 'package:tasck_clean_architecture/core/error/exception.dart';
import 'package:tasck_clean_architecture/src/features/product/data/models/product.dart';
import 'package:http/http.dart' as http;

abstract class ProductRemoteService {
  Future<List<ProductModel>> getProducts(int current);
}

const baseUrl = "https://dummyjson.com/products?limit=10&skip=";

class ProductRemoteServiceImplWithHttp implements ProductRemoteService {
  final http.Client client;
  ProductRemoteServiceImplWithHttp({required this.client});

  @override
  Future<List<ProductModel>> getProducts(int current) async {
    var response = await http.get(Uri.parse(baseUrl + current.toString()));

    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body)["products"] as List;
      final List<ProductModel> productModels = decodedJson
          .map((product) => ProductModel.fromJson(product))
          .toList();
      return productModels;
    } else {
      // print(response.reasonPhrase);
      throw ServerException();
    }
  }
}
