import 'dart:convert';

import 'package:ecommerce_concept/common/constants/constants.dart';
import 'package:ecommerce_concept/core/errors/exceptions.dart';
import 'package:ecommerce_concept/features/feed/data/models/detail_info_model.dart';
import 'package:ecommerce_concept/features/feed/domain/entities/detail_info_entity.dart';
import 'package:http/http.dart' as http;

abstract class DetialInfoRemoteDataSource {
  Future<DetailInfoEntity> getDetailInfo();
}

class DetialInfoRemoteDataSourceImpl implements DetialInfoRemoteDataSource {
  final http.Client client;

  DetialInfoRemoteDataSourceImpl({required this.client});

  @override
  Future<DetailInfoEntity> getDetailInfo() async {
    final response = await client.get(Uri.parse(Constants.PHONE_INFO_ENDPOINT),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      DetailInfoEntity detailInfo = DetailInfoModel.fromJson(data);

      return detailInfo;
    } else {
      throw ServerException();
    }
  }
}
