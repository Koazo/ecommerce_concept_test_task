import 'dart:convert';

import 'package:ecommerce_concept/common/constants/constants.dart';
import 'package:ecommerce_concept/core/errors/exceptions.dart';
import 'package:ecommerce_concept/features/feed/data/models/phone_model.dart';
import 'package:http/http.dart' as http;

abstract class PhoneRemoteDataSource {
  Future<List<PhoneModel>> getAllPhones();
}

class PhoneRemoteDataSourceImpl implements PhoneRemoteDataSource {
  final http.Client client;

  PhoneRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PhoneModel>> getAllPhones() async {
    final response = await client.get(Uri.parse(Constants.PHONES_ENDPOINT),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final phones = json.decode(response.body);
      return (phones as List)
          .map((phone) => PhoneModel.fromJson(phone))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
