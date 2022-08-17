import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/errors/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params? params);
}
