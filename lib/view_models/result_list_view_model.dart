import 'package:flutter/material.dart';
import 'package:one_practical_task/models/result.dart';
import 'package:one_practical_task/services/base_api_sevices.dart';
import 'package:one_practical_task/services/network_api_services.dart';
import 'package:one_practical_task/utils/database_helper.dart';
import 'package:one_practical_task/view_models/result_view_model.dart';

class ListResultViewModel{

  BaseApiService _apiService = NetworkApiService();
  var result;

  Future<void> fetchResList() async {

    dynamic response = await _apiService.getResponse(_apiService.baseUrl);
    print("RES $response");
    final res = response['results'] as List<dynamic>;

    for (int i = 0; i < res.length; i++) {
      print("i: "+i.toString());
      await DatabaseHelper().insertResult(Results.fromJson(res[i]));
    }
    result = await DatabaseHelper().getResList();

    print("result "+result.toString());


  }


}