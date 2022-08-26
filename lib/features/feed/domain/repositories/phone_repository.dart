import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/errors/failure.dart';
import 'package:ecommerce_concept/features/feed/domain/entities/phone_entity.dart';

abstract class PhoneRepository {
  Future<Either<Failure, PhoneEntity>> getAllPhones();
}
