import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marvel_api/model/marvel_model.dart';

var marvelApiUrl = "https://mcuapi.herokuapp.com/api/v1/movies";
List<McuModels> mcuMoviesList = [];
void getMarvelMovies() {
  final uri = Uri.parse(marvelApiUrl);
  http.get(uri).then((response) {
    if (response.statusCode == 200) {
      final responseBody = response.body;
      final decodedData = jsonDecode(responseBody);
      final List marvelData = decodedData['data'];
      for (var i = 0; i < marvelData.length; i++) {
        final mcuMovie =
            McuModels.fromJson(marvelData[i] as Map<String, dynamic>);
        mcuMoviesList.add(mcuMovie);
      }
    } else {}
  }).catchError((err) {});
}
