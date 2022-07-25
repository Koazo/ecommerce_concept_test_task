import 'dart:convert';

import 'package:http/http.dart' as http;

class Phones {
  List<HomeStore>? homeStore;
  List<BestSeller>? bestSeller;

  Phones({this.homeStore, this.bestSeller});

  Phones.fromJson(Map<String, dynamic> json) {
    if (json['home_store'] != null) {
      homeStore = <HomeStore>[];
      json['home_store'].forEach((v) {
        homeStore!.add(new HomeStore.fromJson(v));
      });
    }
    if (json['best_seller'] != null) {
      bestSeller = <BestSeller>[];
      json['best_seller'].forEach((v) {
        bestSeller!.add(new BestSeller.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.homeStore != null) {
      data['home_store'] = this.homeStore!.map((v) => v.toJson()).toList();
    }
    if (this.bestSeller != null) {
      data['best_seller'] = this.bestSeller!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

Future<List<Phones>> getPhones() async {
  final Uri? url = Uri.tryParse(
      'https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175');
  final response = await http.get(url!);

  if (response.statusCode == 200) {
    return List<Phones>.from(
        await jsonDecode(response.body).map((x) => Phones.fromJson(x)));
  } else {
    throw Exception('Error: ${response.body}');
  }
}

class HomeStore {
  int? id;
  bool? isNew;
  String? title;
  String? subtitle;
  String? picture;
  bool? isBuy;

  HomeStore(
      {this.id,
      this.isNew,
      this.title,
      this.subtitle,
      this.picture,
      this.isBuy});

  HomeStore.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isNew = json['is_new'];
    title = json['title'];
    subtitle = json['subtitle'];
    picture = json['picture'];
    isBuy = json['is_buy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_new'] = this.isNew;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['picture'] = this.picture;
    data['is_buy'] = this.isBuy;
    return data;
  }
}

class BestSeller {
  int? id;
  bool? isFavorites;
  String? title;
  int? priceWithoutDiscount;
  int? discountPrice;
  String? picture;

  BestSeller(
      {this.id,
      this.isFavorites,
      this.title,
      this.priceWithoutDiscount,
      this.discountPrice,
      this.picture});

  BestSeller.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isFavorites = json['is_favorites'];
    title = json['title'];
    priceWithoutDiscount = json['price_without_discount'];
    discountPrice = json['discount_price'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_favorites'] = this.isFavorites;
    data['title'] = this.title;
    data['price_without_discount'] = this.priceWithoutDiscount;
    data['discount_price'] = this.discountPrice;
    data['picture'] = this.picture;
    return data;
  }
}
