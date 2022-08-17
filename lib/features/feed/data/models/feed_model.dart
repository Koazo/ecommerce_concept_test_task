import 'package:ecommerce_concept/features/feed/domain/entities/phone_entity.dart';

class FeedModel {
  FeedModel({required this.homeStore, required this.bestSeller});

  List<PhoneEntity> homeStore;
  List<PhoneEntity> bestSeller;

  factory FeedModel.fromJson(Map<String, dynamic> json) {
    return FeedModel(
      homeStore: (json['home_store'] as List<dynamic>)
          .map((phone) => phone as PhoneEntity)
          .toList(),
      bestSeller: (json['best_seller'] as List<dynamic>)
          .map((phone) => phone as PhoneEntity)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'home_store': homeStore,
      'best_seller': bestSeller,
    };
  }
}
