import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/errors/failure.dart';
import 'package:ecommerce_concept/core/errors/usecases/usecase.dart';
import 'package:ecommerce_concept/features/feed/domain/entities/phone_entity.dart';
import 'package:ecommerce_concept/features/feed/domain/repositories/phone_repository.dart';

class GetAllPhones extends UseCase<List<PhoneEntity>, void> {
  final PhoneRepository phoneRepository;

  GetAllPhones(this.phoneRepository);

  @override
  Future<Either<Failure, List<PhoneEntity>>> call(params) async {
    return await phoneRepository.getAllPhones();
  }
}
