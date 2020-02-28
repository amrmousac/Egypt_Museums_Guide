import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../Models/flag_model.dart';

Future<List<FlagModel>> fetchFlagsData(context) async {
 
  final response =
      await DefaultAssetBundle.of(context).loadString('assets/data/flags.json');
 
    return compute(parsePhotos, response);
}

List<FlagModel> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<FlagModel>((json) => FlagModel.fromJson(json)).toList();
}
