import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/errors/failure.dart';
import 'package:ecommerce_concept/core/usecases/usecase.dart';
import 'package:ecommerce_concept/features/feed/domain/entities/detail_info_entity.dart';
import 'package:ecommerce_concept/features/feed/domain/repositories/detail_info_repository.dart';

class GetDetailInfo extends UseCase<DetailInfoEntity, void> {
  final DetailInfoRepository detailInfoRepository;

  GetDetailInfo(this.detailInfoRepository);

  @override
  Future<Either<Failure, DetailInfoEntity>> call(params) async {
    return await detailInfoRepository.getDetailInfo();
  }
}
