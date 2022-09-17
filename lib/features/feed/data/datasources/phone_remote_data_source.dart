import 'dart:convert';

import 'package:ecommerce_concept/common/constants/constants.dart';
import 'package:ecommerce_concept/core/errors/exceptions.dart';
import 'package:ecommerce_concept/features/feed/data/models/best_seller_model.dart';
import 'package:ecommerce_concept/features/feed/data/models/home_store_model.dart';
import 'package:ecommerce_concept/features/feed/data/models/phone_model.dart';
import 'package:ecommerce_concept/features/feed/domain/entities/phone_entity.dart';
import 'package:http/http.dart' as http;

abstract class PhoneRemoteDataSource {
  Future<PhoneEntity> getAllPhones();
}

class PhoneRemoteDataSourceImpl implements PhoneRemoteDataSource {
  final http.Client client;

  PhoneRemoteDataSourceImpl({required this.client});

  @override
  Future<PhoneEntity> getAllPhones() async {
    final response = await client.get(Uri.parse(Constants.PHONES_ENDPOINT),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<HomeStore> homeStore = (data['home_store'] as List)
          .map((e) => HomeStoreModel.fromJson(e))
          .toList();
      List<BestSeller> bestSeller = (data['best_seller'] as List)
          .map((e) => BestSellerModel.fromJson(e))
          .toList();

      PhoneModel phones =
          PhoneModel(homeStore: homeStore, bestSeller: bestSeller);
      return phones;
    } else if (response.statusCode == 502) {
      throw ServerException();
    } else {
      throw ServerException();
    }
  }
}
// _CastError (type '_InternalLinkedHashMap<String, dynamic>' is not a subtype of type 'List<dynamic>' in type cast)