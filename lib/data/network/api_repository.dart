
import 'package:flutter_defualt_project/data/models/valorant_model/valorant_model.dart';
import 'package:flutter_defualt_project/data/network/api_provider.dart';

import '../models/universal_response.dart';

class ApiRepository{
  final ApiProvider apiProvider;
  ApiRepository({required this.apiProvider});

  Future<List<ValorantModel>> getAllData()async{
    UniversalResponse universalResponse=await apiProvider.getAllData();
    if(universalResponse.error.isEmpty){
      print("ERROR:${universalResponse.error}");
      return universalResponse.data as  List<ValorantModel>;
    }
    print("ERROR:${universalResponse.error}");
    return [];
  }
}