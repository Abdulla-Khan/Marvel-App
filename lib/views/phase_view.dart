import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel_api/views/home_view.dart';

class PhaseView extends StatelessWidget {
  PhaseView({
    Key? key,
    required this.phase,
  }) : super(key: key);
  int phase;

  List phaseList = [];

  void phases() {
    print(phaseList);

    for (var i in mcuMoviesList) {
      if (i.phase == phase) {
        phaseList.add(i.phase);
      }
    }
  }

  @override
  void initState() {
    getMarvelMovies();
    mcuMoviesList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mcuMoviesList.isNotEmpty
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: mcuMoviesList[index].phase == phase
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: mcuMoviesList[index].coverUrl != null
                                ? CachedNetworkImage(
                                    imageUrl: mcuMoviesList[index]
                                        .coverUrl
                                        .toString(),
                                  )
                                : const Text('NO DATA'))
                        : Container());
              },
            )
          : const Center(
              child: SizedBox(
              width: 50,
              height: 50,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white70,
                ),
              ),
            )),
    );
  }
}
