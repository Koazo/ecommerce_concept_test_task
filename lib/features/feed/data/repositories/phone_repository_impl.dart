import 'package:ecommerce_concept/core/errors/exceptions.dart';
import 'package:ecommerce_concept/core/platform/network_info.dart';
import 'package:ecommerce_concept/features/feed/data/datasources/phone_remote_data_source.dart';
import 'package:ecommerce_concept/features/feed/domain/entities/phone_entity.dart';
import 'package:ecommerce_concept/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/features/feed/domain/repositories/phone_repository.dart';

class PhoneRepositoryImpl implements PhoneRepository {
  final PhoneRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  PhoneRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, PhoneEntity>> getAllPhones() async {
    try {
      final remotePhone = await remoteDataSource.getAllPhones();
      return Right(remotePhone);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
