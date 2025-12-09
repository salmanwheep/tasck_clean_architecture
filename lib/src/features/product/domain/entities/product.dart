import '../../data/models/product.dart';

class ProductEntity {
  ProductEntity();
  final int id;
  final String title;

  final double price;
  final double rating;
  final String shippingInformation;
  final int reviewsCount;
  
  final String image;

  ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.rating,
    required this.shippingInformation,
    required this.reviewsCount,
    required this.image,
  }); 
  ProductModel get toModel => ProductModel();
}