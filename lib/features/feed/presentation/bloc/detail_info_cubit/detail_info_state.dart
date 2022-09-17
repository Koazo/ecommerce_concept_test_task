import 'package:ecommerce_concept/features/feed/domain/entities/detail_info_entity.dart';
import 'package:equatable/equatable.dart';

abstract class DetailInfoState extends Equatable {
  const DetailInfoState();

  @override
  List<Object?> get props => [];
}

class DetailInfoEmpty extends DetailInfoState {
  @override
  List<Object?> get props => [];
}

class DetailInfoLoading extends DetailInfoState {
  final DetailInfoEntity detailInfo;

  const DetailInfoLoading(this.detailInfo);

  @override
  List<Object?> get props => [detailInfo];
}

class DetailInfoLoaded extends DetailInfoState {
  final DetailInfoEntity detailInfo;

  const DetailInfoLoaded(this.detailInfo);

  @override
  List<Object?> get props => [detailInfo];
}

class DetailInfoError extends DetailInfoState {
  final String message;

  const DetailInfoError({required this.message});

  @override
  List<Object?> get props => [message];
}
