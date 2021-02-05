/**
 * Created by Nguyễn Trung Thành on 2/5/2021.
 *
 * victo202298@gmail.com
 */
import 'dart:convert';
import 'ModelOpenWeather.dart';
import 'package:http/http.dart';

class DataProvider {
  static final String OPEN_CAGE_URL =
      "https://api.opencagedata.com/geocode/v1/";
  static final String OPEN_WEATHER_URL =
      "https://api.openweathermap.org/data/2.5/";

  static final String QueryCity =
      "json?pretty=1&no_annotations=1&no_dedupe=1&no_record=1&litmit=1";
  static final String QueryWeather = "onecall?units=metric";

  static final String appid = "&appid=2ed34880c948e7e9434e5f951f96e18b";
  static final String key = "&key=64b4adc491c8476e93772284769a4005";
}

class CityReposity {
  Client client = Client();
  final baseUrlCity =
      DataProvider.OPEN_CAGE_URL + DataProvider.QueryCity + DataProvider.key;

  Future fetWeather() async {
    Response response;
    response = await client.get("$baseUrlCity");
    if (response.statusCode == 200) {
      return WeatherInfo.fromJson(json.decode(response.body));
    } else {
      throw Exception("No data response");
    }
  }
}

class WeatherReposity {
  Client client = Client();
  final baseWeather = DataProvider.OPEN_WEATHER_URL +
      DataProvider.QueryWeather +
      DataProvider.appid;

  Future fetWeather(double lat, double lon, String exclude) async {
    Response response;
    response =
        await client.get("$baseWeather&lat=$lat&lon=$lon&exclude=$exclude");
    if (response.statusCode == 200) {
      return WeatherInfo.fromJson(json.decode(response.body));
    } else {
      throw Exception("No data response");
    }
  }
}
