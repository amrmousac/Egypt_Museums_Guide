import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../Models/data_model.dart';
import 'package:http/http.dart' as http;

Future<List<DataModel>> fetchMuseumsData(context) async {
  String url = 'https://museums-guide-92224.firebaseio.com/museums.json';
 

  final response =
      await http.get(url);
  if (response.statusCode == 200) {
    return compute(parsePhotos, response.body);
  } else {
   return null;
  }
}

List<DataModel> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<DataModel>((json) => DataModel.fromJson(json)).toList();
}
