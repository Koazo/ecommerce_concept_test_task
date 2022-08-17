import 'package:ecommerce_concept/features/feed/domain/entities/phone_entity.dart';

class BestSellerModel extends BestSeller {
  const BestSellerModel({
    required id,
    required isFavorites,
    required title,
    required priceWithoutDiscount,
    required dicountPrice,
    required picture,
  }) : super(
            id: id,
            isFavorites: isFavorites,
            title: title,
            priceWithoutDiscount: priceWithoutDiscount,
            discountPrice: dicountPrice,
            picture: picture);

  factory BestSellerModel.fromJson(Map<String, dynamic> json) {
    return BestSellerModel(
      id: json['id'],
      isFavorites: json['is_favorites'],
      title: json['title'],
      priceWithoutDiscount: json['price_without_discount'],
      dicountPrice: json['discount_price'],
      picture: json['picture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'is_favorites': isFavorites,
      'title': title,
      'price_without_discount': priceWithoutDiscount,
      'discount_price': discountPrice,
      'picture': picture,
    };
  }
}
