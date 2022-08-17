import 'package:ecommerce_concept/features/feed/domain/entities/phone_entity.dart';

class PhoneModel extends PhoneEntity {
  const PhoneModel({
    required id,
    required isNew,
    required title,
    required subtitle,
    required picture,
    required isBuy,
    required isFavorites,
    required priceWithoutDiscount,
    required discountPrice,
  }) : super(
          id: id,
          isNew: isNew,
          title: title,
          subtitle: subtitle,
          picture: picture,
          isBuy: isBuy,
          isFavorites: isFavorites,
          priceWithoutDiscount: priceWithoutDiscount,
          discountPrice: discountPrice,
        );

  factory PhoneModel.fromJson(Map<String, dynamic> json) {
    return PhoneModel(
      id: json['id'],
      isNew: json['is_new'],
      title: json['title'],
      subtitle: json['subtitle'],
      picture: json['picture'],
      isBuy: json['is_buy'],
      isFavorites: json['is_favorites'],
      priceWithoutDiscount: json['price_without_discount'],
      discountPrice: json['discount_price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'is_new': isNew,
      'title': title,
      'subtitle': subtitle,
      'picture': picture,
      'is_buy': isBuy,
      'is_favorites': isFavorites,
      'price_without_discount': priceWithoutDiscount,
      'discount_price': discountPrice,
    };
  }
}
