import 'package:one_practical_task/models/result_db.dart';
import 'package:one_practical_task/services/map_json_servies.dart';
import 'package:one_practical_task/view_models/result_view_model.dart';

class ListResultViewModel{

  List<ResultViewModel>? resList;

  Future<void> fetchResList() async {

    final apiResult = await MapJsonServices().getResultList();

    // print("list "+apiResult.toString());
    //
    // this.resList = apiResult.map((e) => ResultViewModel(e)).toList();


  }


}