import 'package:flutter/material.dart';
import 'package:mausam/Activity/Home.dart';
import 'package:mausam/Activity/Location.dart';
import 'package:mausam/Activity/Loading.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, routes: {
    "/": (context) => const Loading(),
    "/home": (context) => const Home(),
    "/location": (context) => const Location(),
    "/loading": (context) => const Loading()
  }));
}
