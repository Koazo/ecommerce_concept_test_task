import 'package:ecommerce_concept/features/feed/data/models/best_seller_model.dart';
import 'package:ecommerce_concept/features/feed/data/models/home_store_model.dart';
import 'package:ecommerce_concept/features/feed/domain/entities/phone_entity.dart';

class PhoneModel extends PhoneEntity {
  const PhoneModel({required homeStore, required bestSeller})
      : super(
          homeStore: homeStore,
          bestSeller: bestSeller,
        );

  // factory PhoneModel.fromJson(Map<String, dynamic> json) {
  //   return PhoneModel(
  //     homeStore: json['home_store'] != null
  //         ? HomeStoreModel.fromJson(json['home_store'])
  //         : null,
  //     bestSeller: json['best_seller'] != null
  //         ? BestSellerModel.fromJson(json['best_seller'])
  //         : null,
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'home_store': homeStore,
  //     'best_seller': bestSeller,
  //   };
  // }
}
