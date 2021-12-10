import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practica_2/src/models/trailer_model.dart';

class ApiTrailer {
  Future<List<TrailerModel>?> getTrailer(id) async {
    var URL = Uri.parse(
        'https://api.themoviedb.org/3/movie/${id}/videos?api_key=853ab8ee38da2be44946c51d99ef76d3&language=en-US');

    final response = await http.get(URL);
    if (response.statusCode == 200) {
      var trailers = jsonDecode(response.body)['results'] as List;
      List<TrailerModel> listTrailer =
          trailers.map((trailer) => TrailerModel.fromMap(trailer)).toList();
      return listTrailer;
    } else {
      return null;
    }
  }
}
