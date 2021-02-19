/**
 * Created by Nguyễn Trung Thành on 2/2/2021.
 *
 * victo202298@gmail.com
 */
class ModelOpenWeather {}

class Current {
  double dt;

  int sunrise;

  int sunset;

  double temp;

  double feelsLike;

  int pressure;

  int humidity;

  double dewPoint;

  double uvi;

  int clouds;

  int visibility;

  double windSpeed;

  int windDeg;

  List<Weather> weather;

  Current.fromJson(Map<String, dynamic> jsonMap) {
    dt = double.parse(jsonMap['dt'].toString());
    sunrise = jsonMap['sunrise'];
    sunset = jsonMap['sunset'];
    temp = double.parse(jsonMap['temp'].toString());
    feelsLike = jsonMap['feels_like'];
    pressure = jsonMap['pressure'];
    humidity = jsonMap['humidity'];
    dewPoint = jsonMap['dew_point'];
    uvi = jsonMap['uvi'];
    clouds = jsonMap['clouds'];

    visibility = jsonMap['visibility'];
    windSpeed = jsonMap['wind_speed'];

    windDeg = jsonMap['wind_deg'];
    weather = [];
    int n = jsonMap['weather'].length;
    for (int i = 0; i < n; i++) {
      Weather w = Weather(jsonMap['weather'][i]);
      weather.add(w);
    }
  }
}

class Daily {
  double dt;

  String date;

  int sunrise;

  int sunset;

  Temp temp;

  FeelsLike feelsLike;

  int pressure;

  int humidity;

  double dewPoint;

  double windSpeed;

  int windDeg;

  List<Weather> weather;

  int clouds;

  double pop;

  double rain;

  double uvi;

  int visibility;

  Daily(json) {
    dt = double.parse(json['dt'].toString());;
    date = json['date'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    temp = Temp(json['temp']);
    feelsLike = FeelsLike(json['feels_like']);
    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = json['dew_point'];
    windSpeed = json['wind_speed'];
    windDeg = json['wind_deg'];
    clouds = json['clouds'];
    pop = double.parse(json['pop'].toString());;
    rain = json['rain'];
    uvi = double.parse(json['uvi'].toString());;
    visibility = json['visibility'];
    weather = [];
    int n = json['weather'].length;
    for (int i = 0; i < n; i++) {
      Weather w = Weather(json['weather'][i]);
      weather.add(w);
    }
  }
}

class FeelsLike {
  double day;

  double night;

  double eve;

  double morn;

  FeelsLike(feelslike) {
    day = feelslike['day'];
    night = feelslike['night'];
    eve = feelslike['eve'];
    morn = feelslike['morn'];
  }
}

class Temp {
  double day;

  double min;

  double max;

  double night;

  double eve;

  double morn;

  Temp(temp) {
    day = temp['day'];
    min = temp['min'];
    max = temp['night'];
    night = temp['night'];
    eve = temp['eve'];
    morn = temp['morn'];
  }
}

class Weather {
  int id;

  String main;

  String description;

  String icon;

  Weather(weather) {
    id = weather['id'];
    main = weather['main'];
    description = weather['description'];
    icon = weather['icon'];
  }
}

class WeatherInfo {
  double lat;

  double lon;

  String timezone;

  int timezoneOffset;

  Current current;

  List<Daily> daily;

  WeatherInfo.fromJson(Map<String,dynamic> weatherInfo) {
    lat = weatherInfo['lat'];
    lon = weatherInfo['lon'];
    timezone = weatherInfo['timezone'];
    timezoneOffset = weatherInfo['timezone_offset'];
    current = Current.fromJson(weatherInfo['current']);

    daily = [];
    int n = weatherInfo['daily'].length;
    for (int i = 0; i < n; i++) {
      Daily w = Daily(weatherInfo['daily'][i]);
      daily.add(w);
    }
  }
}
