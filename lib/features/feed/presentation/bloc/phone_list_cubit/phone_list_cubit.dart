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
    PhoneEntity phones;
    if (currentState is PhonesLoaded) {
      phones = currentState.phonesList;
    } else {
      phones = const PhoneEntity(homeStore: [], bestSeller: []);
    }

    emit(PhonesLoading(phones));

    final failureOrPhones = await getAllPhones(null);

    phones = failureOrPhones.toIterable().first;
    emit(PhonesLoaded(phones));
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
