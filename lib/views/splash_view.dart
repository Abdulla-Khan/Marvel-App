import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:marvel_api/views/home_view.dart';

import '../model/marvel_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

List<McuModels> mcuMoviesList = [];

class _SplashScreenState extends State<SplashScreen> {
  var marvelApiUrl = "https://mcuapi.herokuapp.com/api/v1/movies";
  void getMarvelMovies() {
    debugPrint('=========== Function running =============');

    final uri = Uri.parse(marvelApiUrl);
    http.get(uri).then((response) {
      final responseBody = response.body;
      final decodedData = jsonDecode(responseBody);
      if (response.statusCode == 200) {
        final List marvelData = decodedData['data'];
        for (var i = 0; i < marvelData.length; i++) {
          final mcuMovie =
              McuModels.fromJson(marvelData[i] as Map<String, dynamic>);
          mcuMoviesList.add(mcuMovie);
        }
      } else {}
    }).catchError((err) {
      debugPrint('=========== $err =============');
    });
  }

  @override
  void initState() {
    getMarvelMovies();
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
              child: Image(
            image: AssetImage('assets/splash.gif'),
            fit: BoxFit.cover,
          )),
        ));
  }
}
