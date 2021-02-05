/**
 * Created by Nguyễn Trung Thành on 2/5/2021.
 *
 * victo202298@gmail.com
 */
class Bounds {
  Location northeast = null;
  Location southwest = null;
  Bounds(json){
    northeast = Location(json['northeast']);
    southwest = Location(json['southwest']);
  }
}

class Location {
  double lat = null;
  double lng = null;
  Location(json){
    lat= json['lat'];
    lng = json['lng'];
  }
}

class CityInfo {
  String documentation = null;

  String thanks = null;
  int totalResults = null;
  Rate rate = null;

  Status status = null;

  StayInformed stayInformed = null;

  Timestamp timestamp = null;

  List<License> licenses = null;
  List<Result> results = null;

  CityInfo.fromJson(Map<String, dynamic> json){
    documentation = json['documentation'];
    thanks = json['thanks'];
    totalResults = json['totalResults'];
    rate = Rate(json['rate']);
    status = Status(json['status']);
    stayInformed = StayInformed(json['stayInformed']);
    timestamp = Timestamp(json['timestamp']);

    int n = json['licenses'].length;
    licenses = [];
    for(int i =0; i < n ; i++){
      License ls = License(json['licenses'][i]);
      licenses.add(ls);
    }

    n = json['results'].length;
    results = [];
    for(int i =0; i < n ; i++){
      Result ls = Result(json['results'][i]);
      results.add(ls);
    }
  }

}
class License {
  String name = null;

  String url = null;
  License(json){
    name = json['name'];
    url = json['url'];
  }
}

class Rate {
  int limit = null;

  int remaining = null;

  int reset = null;

  Rate(json){
    limit = json['limit'];
    remaining = json['remaining'];
    reset = json['reset'];
  }
}

class Components {

  String iSO31661Alpha2 = null;

  String iSO31661Alpha3 = null;

  String category = null;

  String type = null;

  String city = null;

  String cityDistrict = null;

  String continent = null;

  String country = null;


  String countryCode = null;

  String hamlet = null;

  String state = null;

  String stateCode = null;

  String county = null;

  String postcode = null;

  String quarter = null;

  String town = null;

  String residential = null;

  String stateDistrict = null;

  String village = null;

  String municipality = null;

  String neighbourhood = null;

  String road = null;

  String roadType = null;

  String region = null;

  Components(json){

    iSO31661Alpha2 = json['iSO31661Alpha2'];

    iSO31661Alpha3 = json['iSO31661Alpha3'];

    category = json['category'];

    type = json['type'];

    city = json['city'];

    cityDistrict = json['cityDistrict'];

    continent = json['continent'];

    country = json['country'];


    countryCode = json['countryCode'];

    hamlet = json['hamlet'];

    state = json['state'];

    stateCode = json['stateCode'];

    county = json['county'];

    postcode = json['postcode'];

    quarter = json['quarter'];

    town = json['town'];

    residential = json['residential'];

    stateDistrict = json['stateDistrict'];

    village = json['village'];

    municipality = json['municipality'];

    neighbourhood = json['neighbourhood'];

    road = json['road'];

    roadType = json['roadType'];

    region = json['region'];
  }
}

class Result {

  int confidence = null;
  String formatted = null;

  Bounds bounds = null;
  Components components = null;
  Location geometry = null;

  Result(json){
    confidence = json['confidence'];
    formatted = json['formatted'];

    bounds = Bounds(json['bounds']);
    components = Components(json['components']);
    geometry = Location(json['geometry']);
  }
}
class Status {
  int code = null;

  String message = null;
  Status(json){
    code = json['code'];
    message = json['message'];
  }
}
class Timestamp {
  String createdHttp = null;

  int createdUnix = null;
  Timestamp(json){
    createdHttp = json['createdHttp'];
    createdUnix = json['createdUnix'];
  }
}
class StayInformed {

  String blog = null;

  String twitter = null;
  StayInformed(json){
    blog = json['blog'];
    twitter = json['twitter'];
  }
}