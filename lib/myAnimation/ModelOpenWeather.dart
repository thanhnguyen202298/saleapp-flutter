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
    dt = jsonMap['dt'];
    sunrise = jsonMap['sunrise'];
    sunset = jsonMap['sunset'];
    temp = jsonMap['temp'];
    feelsLike = jsonMap['feelsLike'];
    pressure = jsonMap['pressure'];
    humidity = jsonMap['humidity'];
    dewPoint = jsonMap['dewPoint'];
    uvi = jsonMap['uvi'];
    clouds = jsonMap['clouds'];

    visibility = jsonMap['visibility'];
    windSpeed = jsonMap['windSpeed'];

    windDeg = jsonMap['windDeg'];
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
    dt = json['dt'];
    date = json['date'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    temp = Temp(json['temp']);
    feelsLike = FeelsLike(json['feelsLike']);
    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = json['dewPoint'];
    windSpeed = json['windSpeed'];
    windDeg = json['windDeg'];
    clouds = json['clouds'];
    pop = json['pop'];
    rain = json['rain'];
    uvi = json['uvi'];
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
    timezoneOffset = weatherInfo['timezoneOffset'];
    current = Current.fromJson(weatherInfo['current']);

    daily = [];
    int n = weatherInfo['daily'].length;
    for (int i = 0; i < n; i++) {
      Daily w = Daily(weatherInfo['daily'][i]);
      daily.add(w);
    }
  }
}
