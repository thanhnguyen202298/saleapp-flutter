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

  List<License> licenses = null;

  Rate rate = null;

  List<Result> results = null;

  Status status = null;

  StayInformed stayInformed = null;

  String thanks = null;

  Timestamp timestamp = null;

  int totalResults = null;
}
class License {
  String name = null;

  String url = null;
}

class Rate {
  int limit = null;

  int remaining = null;

  int reset = null;
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
}
class Status {
  int code = null;

  String message = null;
}
class Timestamp {
  String createdHttp = null;

  int createdUnix = null;
}
class StayInformed {

  String blog = null;

  String twitter = null;
}