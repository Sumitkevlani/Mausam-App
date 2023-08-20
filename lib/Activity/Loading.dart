import 'package:flutter/material.dart';
import 'package:mausam/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String temperature = "";
  String humidity = "";
  String windSpeed = "";
  String description = "";
  String icon = "";
  String city = "Beawar";
  void getData(String city) async {
    try {
      Worker worker = Worker(city);
      await worker.getData();
      temperature = worker.temperature;
      humidity = worker.humidity;
      windSpeed = worker.windSpeed;
      description = worker.description;
      city = worker.location;
      icon = worker.icon;
      Navigator.pushReplacementNamed(context, "/home", arguments: {
        "temperature": temperature,
        "humidity": humidity,
        "windSpeed": windSpeed,
        "description": description,
        "city": city,
        "icon": icon
      });
    } catch (e) {
      temperature = "NA";
      humidity = "NA";
      windSpeed = "NA";
      description = "Couldn't find data";
      city = city;
      icon = "09d";
      Navigator.pushReplacementNamed(context, "/home", arguments: {
        "temperature": temperature,
        "humidity": humidity,
        "windSpeed": windSpeed,
        "description": description,
        "city": city,
        "icon": icon
      });
    }
  }

  void startLoading(String city) async {
    await Future.delayed(const Duration(seconds: 2));
    getData(city);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map? searchData = ModalRoute.of(context)?.settings.arguments as Map?;

    if (searchData != null && searchData.containsKey("city")) {
      city = searchData["city"];
      print(city);
    }
    startLoading(city);
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/background_image.png'),
            const Text("Mausam",
                style: TextStyle(color: Colors.white, fontSize: 30.0)),
            const SizedBox(height: 20.0),
            const Text("Made by Sumit",
                style: TextStyle(color: Colors.white, fontSize: 10.0)),
            const SizedBox(height: 30.0),
            const SpinKitWave(
              color: Colors.white,
              size: 50.0,
            ),
          ]),
    );
  }
}
