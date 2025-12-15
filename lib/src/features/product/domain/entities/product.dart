import '../../data/models/product.dart';

class ProductEntity {
  final int id;
  final String title;

  final double price;
  final double rating;
  final String shippingInformation;
  final int reviewsCount;

  final String image;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.rating,
    required this.shippingInformation,
    required this.reviewsCount,
    required this.image,
  });
  ProductModel get toModel => ProductModel(
    id: id,
    title: title,
    price: price,
    rating: rating,
    shippingInformation: shippingInformation,
    reviewsCount: reviewsCount,
    image: image,
  );
}
