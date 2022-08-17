import 'package:equatable/equatable.dart';

class PhoneInfoEntity extends Equatable {
  final String id;
  final String title;
  final bool isFavorites;
  final int price;
  final List<String> capacity;
  final List<String> color;
  final List<String> images;
  final String cpu;
  final String camera;
  final double rating;
  final String sdCard;
  final String ssd;

  const PhoneInfoEntity(
      {required this.id,
      required this.title,
      required this.isFavorites,
      required this.price,
      required this.capacity,
      required this.color,
      required this.images,
      required this.cpu,
      required this.camera,
      required this.rating,
      required this.sdCard,
      required this.ssd});

  @override
  List<Object?> get props => [
        id,
        title,
        isFavorites,
        price,
        capacity,
        color,
        images,
        cpu,
        camera,
        rating,
        sdCard,
        ssd
      ];
}
