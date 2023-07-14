import 'dart:convert';

import 'package:flutter_defualt_project/data/models/valorant_model/valorant_model.dart';
import 'package:http/http.dart' as http;

import '../models/universal_response.dart';

class ApiProvider {
  Future<UniversalResponse> getAllData() async {
    Uri uri = Uri.parse("https://valorant-api.com/v1/agents");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
            data: (jsonDecode(response.body)['data'] as List?)?.map((e) =>
                ValorantModel.fromJson(e)).toList() ?? []);
      }
      return UniversalResponse(error: "ERROR");
    }catch (error){
      print("ERROR:$error");
      return UniversalResponse(error: error.toString());
    }
  }
}