import 'package:ecommerce_concept/features/feed/domain/entities/detail_info_entity.dart';

class DetailInfoModel extends DetailInfoEntity {
  const DetailInfoModel(
      {required cPU,
      required camera,
      required capacity,
      required color,
      required id,
      required images,
      required isFavorites,
      required price,
      required rating,
      required sd,
      required ssd,
      required title})
      : super(
            cPU: cPU,
            camera: camera,
            capacity: capacity,
            color: color,
            id: id,
            images: images,
            isFavorites: isFavorites,
            price: price,
            rating: rating,
            sd: sd,
            ssd: ssd,
            title: title);

  factory DetailInfoModel.fromJson(Map<String, dynamic> json) {
    return DetailInfoModel(
        cPU: json['CPU'],
        camera: json['camera'],
        capacity: json['capacity'].cast<String>(),
        color: json['color'].cast<String>(),
        id: json['id'],
        images: json['images'].cast<String>(),
        isFavorites: json['isFavorites'],
        price: json['price'],
        rating: json['rating'],
        sd: json['sd'],
        ssd: json['ssd'],
        title: json['title']);
  }

  Map<String, dynamic> toJson() {
    return {
      'CPU': cPU,
      'camera': camera,
      'capacity': capacity,
      'color': color,
      'id': id,
      'images': images,
      'isFavorites': isFavorites,
      'price': price,
      'rating': rating,
      'sd': sd,
      'ssd': ssd,
      'title': title,
    };
  }
}
