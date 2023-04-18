import 'package:flutter/material.dart';
import 'package:sampleproject/landing.dart';
import 'package:sampleproject/Countries_wise.dart';
import 'package:sampleproject/signin.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sampleproject/splashscreen.dart';
import 'package:sampleproject/worldstate.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      
      //theme: const TextStyle(color: Colors.white),
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
