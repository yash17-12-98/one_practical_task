
abstract class BaseApiService {

  final String baseUrl = "https://maps.googleapis.com/maps/api/place/search/json?location=23.03744,72.566&rankby=distance&types=bakery&sensor=true&key=AIzaSyB2Az9gVUzQULUc55xQD9AE7gj9Ni5hvJk";
  Future<dynamic> getResponse(String url);
  Future<dynamic> postResponse(String url,Map<String, String> jsonBody);

}