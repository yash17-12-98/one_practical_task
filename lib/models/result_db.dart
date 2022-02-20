class ResultDB {

  int? _id;
  String? _name;
  String? _icon;
  double? _lat;
  double? _lng;
  String? _vicinity;

  ResultDB(this._name, this._icon, this._lat, this._lng, this._vicinity);

  ResultDB.withId(this._id, this._name,this._icon, this._lat, this._lng, this._vicinity);

  int? get id => _id;

  String get name => _name!;
  
  String get icon => _icon!;

  double get lat => _lat!;

  double get lng => _lng!;

  String get vicinity => _vicinity!;
  

  set name(String newName) {
      this._name = newName;

  }

  set icon(String newIcon) {

      this._icon = newIcon;

  }

  set lat(double newLat) {

      this._lat = newLat;

  }

  set lng(double newLng) {
    this._lng = newLng;
  }

  set vicinity(String newVic) {
    this._vicinity = newVic;
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['icon'] = _icon;
    map['lat'] = _lat;
    map['lng'] = _lng;
    map['vicinity'] = _vicinity;

    return map;
  }


  ResultDB.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._icon = map['icon'];
    this._lat = map['lat'];
    this._lng = map['lng'];
    this._vicinity = map['vicinity'];
  }
}









