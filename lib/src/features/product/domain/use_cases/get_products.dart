import '../repositories/product.dart';

class GetProductsUseCase {
  final ProductRepository _repository;

  GetProductsUseCase(this._repository);

  Future<Either<Failure, List<ProductEntity>>> execute() async{
    return await _repository.getProducts();
  }
}