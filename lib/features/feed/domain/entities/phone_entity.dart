import 'package:equatable/equatable.dart';

class PhoneEntity extends Equatable {
  final int id;
  final bool isNew;
  final String title;
  final String subtitle;
  final String picture;
  final bool isBuy;
  final bool isFavorites;
  final int priceWithoutDiscount;
  final int discountPrice;

  const PhoneEntity({
    required this.id,
    required this.isNew,
    required this.title,
    required this.subtitle,
    required this.picture,
    required this.isBuy,
    required this.isFavorites,
    required this.priceWithoutDiscount,
    required this.discountPrice,
  });

  @override
  List<Object?> get props => [
        id,
        isNew,
        title,
        subtitle,
        picture,
        isBuy,
        isFavorites,
        priceWithoutDiscount,
        discountPrice,
      ];
}
