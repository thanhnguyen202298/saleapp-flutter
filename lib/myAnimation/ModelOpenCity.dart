/**
 * Created by Nguyễn Trung Thành on 2/5/2021.
 *
 * victo202298@gmail.com
 */
class Bounds {
  Northeast northeast = null;

  Southwest southwest = null;
}

class Northeast {
  double lat = null;

  double lng = null;
}
class Geometry {
  double lat = null;

  double lng = null;
}
class Southwest {

  double lat = null;

  double lng = null;
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
}

class Result {

  Bounds bounds = null;

  Components components = null;

  int confidence = null;

  String formatted = null;

  Geometry geometry = null;

  Result(json){
    bounds = json['bounds'];
    components = json['components'];
    confidence = json['confidence'];
    formatted = json['formatted'];
    geometry = json['geometry'];
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