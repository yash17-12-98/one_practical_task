import 'package:one_practical_task/models/result.dart';
import 'package:one_practical_task/models/result_db.dart';
import 'package:one_practical_task/services/base_api_sevices.dart';
import 'package:one_practical_task/services/network_api_services.dart';
import 'package:one_practical_task/utils/database_helper.dart';

class MapJsonServices {

  BaseApiService _apiService = NetworkApiService();
  List<ResultDB>? result;

  @override
  Future<void> getResultList() async {

      dynamic response = await _apiService.getResponse(_apiService.baseUrl);
      print("RES $response");
      final res = response['results'] as List<dynamic>;

      for (var rawUser in res) {
        var user = ResultDB.fromMapObject(rawUser);
        await DatabaseHelper().insertResult(user);
      }
      result = await DatabaseHelper().getResList();

      final listResult = res.map((e) => Results.fromJson(e)).toList();

      print("this response : "+ result.toString());
      // return listResult;

  }
}