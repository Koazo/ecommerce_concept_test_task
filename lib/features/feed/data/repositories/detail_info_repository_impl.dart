import 'package:ecommerce_concept/core/errors/exceptions.dart';
import 'package:ecommerce_concept/core/platform/network_info.dart';
import 'package:ecommerce_concept/features/feed/data/datasources/detail_info_remote_data_source.dart';
import 'package:ecommerce_concept/features/feed/domain/entities/detail_info_entity.dart';
import 'package:ecommerce_concept/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/features/feed/domain/repositories/detail_info_repository.dart';

class DetailInfoRepositoryImpl implements DetailInfoRepository {
  final DetialInfoRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  DetailInfoRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, DetailInfoEntity>> getDetailInfo() async {
    try {
      final remotePhone = await remoteDataSource.getDetailInfo();
      return Right(remotePhone);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
