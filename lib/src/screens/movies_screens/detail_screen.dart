import 'package:flutter/material.dart';
import 'package:practica_2/src/models/popular_movies_model.dart';
import 'package:practica_2/src/models/trailer_model.dart';
import 'package:practica_2/src/network/api_trailer.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  PopularMoviesModel? popular;
  ApiTrailer? apiTrailer;
  TrailerModel? trailerModel;
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    popular = PopularMoviesModel();
    apiTrailer = ApiTrailer();
  }

  @override
  Widget build(BuildContext context) {
    final movie =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    print(movie);
    return Scaffold(
        body: FutureBuilder(
            future: apiTrailer!.getTrailer(movie['id'].toString()),
            builder: (BuildContext context,
                AsyncSnapshot<List<TrailerModel>?> snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Hay un error'));
              } else {
                if (snapshot.connectionState == ConnectionState.done) {
                  return _detailsMovie(snapshot.data);
                } else {
                  return CircularProgressIndicator();
                }
              }
            }));
  }

  Widget _detailsMovie(List<TrailerModel>? trailer) {
    for (var i = 0; i < trailer!.length; i++) {
      if (trailer[i].type == 'Trailer') {
        trailerModel = trailer[i];
      }
    }
    controller = YoutubePlayerController(
        initialVideoId: trailerModel!.key!.toString(),
        params: YoutubePlayerParams(
            showControls: true, showFullscreenButton: true));
    return Column(
      children: [
        YoutubePlayerControllerProvider(
            controller: controller,
            child: YoutubePlayerIFrame(
              controller: controller,
            )),
        
      ],
    );
  }
}
