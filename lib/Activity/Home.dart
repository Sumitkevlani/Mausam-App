import 'package:flutter/material.dart';
import 'package:dynamic_weather_icons/dynamic_weather_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
    print("State disposed.");
  }

  @override
  Widget build(BuildContext context) {
    Map info = ModalRoute.of(context)?.settings.arguments as Map;
    String humidity = info["humidity"].toString();
    String temperature = (info["temperature"].toString());
    if (temperature != "NA") {
      temperature = temperature.substring(0, 4);
    }
    String windSpeed = (info["windSpeed"].toString());
    if (windSpeed != "NA") {
      windSpeed = windSpeed.substring(0, 4);
    }
    String description = info["description"].toString();
    String city = info["city"].toString();
    String icon = info["icon"].toString();

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(backgroundColor: Colors.red)),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF1565C0), // Dark blue
              Color(0xFF64B5F6), // Light blue
            ],
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                margin: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 14.0),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          if (searchController.text.trim() == "") {
                            print("Empty");
                          } else {
                            Navigator.pushReplacementNamed(context, "/loading",
                                arguments: {"city": searchController.text});
                          }
                        },
                        child: Container(
                            margin:
                                const EdgeInsets.fromLTRB(3.0, 0.0, 7.0, 0.0),
                            child: const Icon(Icons.search))),
                    Expanded(
                        child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                          hintText: "Search any city name...",
                          border: InputBorder.none),
                    ))
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(25.0)),
                      padding: const EdgeInsets.all(25.0),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 0.0),
                      child: Row(children: <Widget>[
                        Container(
                          height: 50,
                          width: 50,
                          child: Image.network(
                              "https://openweathermap.org/img/wn/$icon@2x.png",
                              fit: BoxFit.cover),
                        ),
                        const SizedBox(width: 30.0),
                        Column(
                          children: <Widget>[
                            Text(description,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            Text("In $city",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold))
                          ],
                        )
                      ]),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(25.0)),
                      height: 200.0,
                      width: 200.0,
                      padding: const EdgeInsets.all(30.0),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            WeatherIcon.getIcon('wi-thermometer'),
                            color: Colors.white,
                            size: 50.0,
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("Temperature",
                                      style: TextStyle(
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(temperature,
                                      style: const TextStyle(fontSize: 70.0)),
                                  const Text("C",
                                      style: TextStyle(
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold))
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(25.0)),
                      height: 200.0,
                      padding: const EdgeInsets.all(20.0),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Column(children: <Widget>[
                        Icon(
                          WeatherIcon.getIcon('wi-day-light-wind'),
                          color: Colors.white,
                          size: 50.0,
                        ),
                        const SizedBox(height: 30.0),
                        Text(windSpeed,
                            style: const TextStyle(
                                fontSize: 40.0, fontWeight: FontWeight.bold)),
                        const Text("km/hr",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                      ]),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(25.0)),
                      height: 200.0,
                      padding: const EdgeInsets.all(20.0),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Column(children: <Widget>[
                        Icon(
                          WeatherIcon.getIcon('wi-humidity'),
                          color: Colors.white,
                          size: 50.0,
                        ),
                        const SizedBox(height: 30.0),
                        Text(humidity,
                            style: const TextStyle(
                                fontSize: 40.0, fontWeight: FontWeight.bold)),
                        const Text("%",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                      ]),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              const Column(
                children: <Widget>[
                  Text("Made by Sumit", style: TextStyle(color: Colors.white)),
                  Text("Data provided by OpenWeatherMap.org",
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
