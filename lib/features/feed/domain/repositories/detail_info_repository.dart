import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/errors/failure.dart';
import 'package:ecommerce_concept/features/feed/domain/entities/detail_info_entity.dart';

abstract class DetailInfoRepository {
  Future<Either<Failure, DetailInfoEntity>> getDetailInfo();
}
