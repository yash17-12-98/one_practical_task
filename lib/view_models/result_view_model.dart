import 'package:one_practical_task/models/result.dart';

class ResultViewModel{
  Results _resultModel;

  ResultViewModel(this._resultModel);

  String? get name{
    return this._resultModel.name;
  }

  double? get lat {
    return this._resultModel.lat;
  }

  double? get long {
    return this._resultModel.lng;
  }

  String? get icon {
    return this._resultModel.icon;
  }

  String? get vicinity{
    return this._resultModel.vicinity;
  }

}