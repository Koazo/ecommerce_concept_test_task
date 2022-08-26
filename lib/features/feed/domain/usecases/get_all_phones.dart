import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/errors/failure.dart';
import 'package:ecommerce_concept/core/usecases/usecase.dart';
import 'package:ecommerce_concept/features/feed/domain/entities/phone_entity.dart';
import 'package:ecommerce_concept/features/feed/domain/repositories/phone_repository.dart';

class GetAllPhones extends UseCase<PhoneEntity, void> {
  final PhoneRepository phoneRepository;

  GetAllPhones(this.phoneRepository);

  @override
  Future<Either<Failure, PhoneEntity>> call(params) async {
    return await phoneRepository.getAllPhones();
  }
}
