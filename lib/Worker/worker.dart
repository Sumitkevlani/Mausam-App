import 'package:http/http.dart';
import 'dart:convert';

class Worker {
  String location = "";
  String humidity = "";
  String temperature = "";
  String description = "";
  String windSpeed = "";
  String icon = "";
  Worker(String location) {
    this.location = location;
  }
  Future<void> getData() async {
    Response response = await get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=8487d75e2d6ec5069a20b03e37579e67"));

    Map data = jsonDecode(response.body);
    Map mainData = data["main"];
    humidity = mainData["humidity"].toString();
    temperature = (mainData["temp"] - 273.15).toString();

    Map windData = data["wind"];
    windSpeed = ((windData["speed"] * 18) / 5).toString();

    List weatherData = data["weather"];
    description = weatherData[0]["description"].toString();
    icon = weatherData[0]["icon"].toString();
  }
}
