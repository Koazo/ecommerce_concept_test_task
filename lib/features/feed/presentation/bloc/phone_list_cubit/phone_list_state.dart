import 'package:ecommerce_concept/features/feed/domain/entities/phone_entity.dart';
import 'package:equatable/equatable.dart';

abstract class PhonesState extends Equatable {
  const PhonesState();

  @override
  List<Object?> get props => [];
}

class PhonesEmpty extends PhonesState {
  @override
  List<Object?> get props => [];
}

class PhonesLoading extends PhonesState {
  final PhoneEntity phonesList;

  const PhonesLoading(this.phonesList);

  @override
  List<Object?> get props => [phonesList];
}

class PhonesLoaded extends PhonesState {
  final PhoneEntity phonesList;

  const PhonesLoaded(this.phonesList);

  @override
  List<Object?> get props => [phonesList];
}

class PhonesError extends PhonesState {
  final String message;

  const PhonesError({required this.message});

  @override
  List<Object?> get props => [message];
}
