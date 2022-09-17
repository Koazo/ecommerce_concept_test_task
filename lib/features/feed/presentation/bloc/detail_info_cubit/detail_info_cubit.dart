import 'package:ecommerce_concept/core/errors/failure.dart';
import 'package:ecommerce_concept/features/feed/domain/entities/detail_info_entity.dart';
import 'package:ecommerce_concept/features/feed/domain/usecases/get_detail_info.dart';
import 'package:ecommerce_concept/features/feed/presentation/bloc/detail_info_cubit/detail_info_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailInfoCubit extends Cubit<DetailInfoState> {
  final GetDetailInfo getDetailInfo;
  DetailInfoCubit({required this.getDetailInfo}) : super(DetailInfoEmpty());

  void loadDetailInfo() async {
    if (state is DetailInfoLoading) return;
    final currentState = state;
    DetailInfoEntity detailInfo;
    if (currentState is DetailInfoLoaded) {
      detailInfo = currentState.detailInfo;
    } else {
      detailInfo = const DetailInfoEntity(
          cPU: '',
          camera: '',
          capacity: [],
          color: [],
          id: '',
          images: [],
          isFavorites: true,
          price: 1,
          rating: 1,
          sd: '',
          ssd: '',
          title: '');
    }

    emit(DetailInfoLoading(detailInfo));

    final failureOrPhones = await getDetailInfo(null);

    detailInfo = failureOrPhones.toIterable().first;
    emit(DetailInfoLoaded(detailInfo));
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
