class Results {
  int? id;
  String? name;
  String? icon;
  double? lat;
  double? lng;
  String? vicinity;


  Results(this.name,
        this.icon,
        this.lat,
        this.lng,
        this.vicinity);

  Results.withId(this.id, this.name,this.icon, this.lat, this.lng, this.vicinity);

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    lat = json['geometry']['location']['lat'];
    lng = json['geometry']['location']['lng'];
    vicinity = json['vicinity'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['geometry']['location']['lat'] = this.lat;
    data['geometry']['location']['lng'] = this.lng;
    data['vicinity'] = this.vicinity;
    return data;
  }


  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['icon'] = icon;
    map['lat'] = lat.toString();
    map['lng'] = lng;
    map['vicinity'] = vicinity;

    return map;
  }


  Results.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.icon = map['icon'];
    this.lat = double.parse(map['lat']);
    this.lng = double.parse(map['lng']);
    this.vicinity = map['vicinity'];
  }
}

