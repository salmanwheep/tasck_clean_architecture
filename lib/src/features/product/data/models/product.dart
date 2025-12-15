import '../../domain/entities/product.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.rating,
    required super.shippingInformation,
    required super.reviewsCount,
    required super.image,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      rating: json['rating'],
      shippingInformation: json['shippingInformation'],
      reviewsCount: json['reviews'].length,
      image: json['images'].first,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'rating': rating,
      'shippingInformation': shippingInformation,
      'reviews': reviewsCount,
      'image': image,
    };
  }
}
