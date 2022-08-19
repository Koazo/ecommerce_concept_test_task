import 'package:ecommerce_concept/core/errors/failure.dart';
import 'package:ecommerce_concept/features/feed/domain/entities/phone_entity.dart';
import 'package:ecommerce_concept/features/feed/domain/usecases/get_all_phones.dart';
import 'package:ecommerce_concept/features/feed/presentation/bloc/phone_list_cubit/phone_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhonesListCubit extends Cubit<PhonesState> {
  final GetAllPhones getAllPhones;
  PhonesListCubit({required this.getAllPhones}) : super(PhonesEmpty());

  void loadPhones() async {
    if (state is PhonesLoading) return;

    final currentState = state;

    var phones = <PhoneEntity>[];
    if (currentState is PhonesLoaded) {
      phones = currentState.phonesList;
    }

    emit(PhonesLoading(phones));

    final failureOrPhones = await getAllPhones(null);
    failureOrPhones.fold(
        (error) => PhonesError(message: _mapFailureToMessage(error)), (result) {
      final phones = (state as PhonesLoading).phonesList;
      phones.addAll(result);
      emit(PhonesLoaded(phones));
    });
  }

  String _mapFailureToMessage(Failure error) {
    switch (error.runtimeType) {
      case ServerFailure:
        return 'Something went wrong. Server failure.';
      default:
        return 'Unexpected error';
    }
  }
}
