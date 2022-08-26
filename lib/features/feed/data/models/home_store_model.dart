import 'package:ecommerce_concept/features/feed/domain/entities/phone_entity.dart';

class HomeStoreModel extends HomeStore {
  const HomeStoreModel({
    required id,
    required isNew,
    required title,
    required subtitle,
    required picture,
    required isBuy,
  }) : super(
            id: id,
            isNew: isNew ?? false,
            title: title,
            subtitle: subtitle,
            picture: picture,
            isBuy: isBuy);

  factory HomeStoreModel.fromJson(Map<String, dynamic> json) {
    return HomeStoreModel(
      id: json['id'],
      isNew: json['is_new'],
      title: json['title'],
      subtitle: json['subtitle'],
      picture: json['picture'],
      isBuy: json['is_buy'],
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
    };
  }
}
