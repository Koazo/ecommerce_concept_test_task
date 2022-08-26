import 'package:equatable/equatable.dart';

class PhoneEntity extends Equatable {
  final List<HomeStore> homeStore;
  final List<BestSeller> bestSeller;

  const PhoneEntity({required this.homeStore, required this.bestSeller});
  @override
  List<Object?> get props => [homeStore, bestSeller];
}

class HomeStore extends Equatable {
  final int id;
  final bool isNew;
  final String title;
  final String subtitle;
  final String picture;
  final bool isBuy;

  const HomeStore(
      {required this.id,
      required this.isNew,
      required this.title,
      required this.subtitle,
      required this.picture,
      required this.isBuy});

  @override
  List<Object?> get props => [id, isNew, title, subtitle, picture, isBuy];
}

class BestSeller extends Equatable {
  final int id;
  final bool isFavorites;
  final String title;
  final int priceWithoutDiscount;
  final int discountPrice;
  final String picture;

  const BestSeller(
      {required this.id,
      required this.isFavorites,
      required this.title,
      required this.priceWithoutDiscount,
      required this.discountPrice,
      required this.picture});

  @override
  List<Object?> get props =>
      [id, isFavorites, title, priceWithoutDiscount, discountPrice, picture];
}
