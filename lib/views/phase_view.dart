import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel_api/views/home_view.dart';

class PhaseView extends StatelessWidget {
  PhaseView({
    Key? key,
    required this.phase,
  }) : super(key: key);
  int phase;


  @override
  void initState() {
    getMarvelMovies();
    mcuMoviesList;
  }

final _newList = mcuMoviesList.where((item) => item.phase == 1).toList();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      body: mcuMoviesList.isNotEmpty
          ? GridView.builder(
            itemCount: _newList.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child:ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: _newList[index].coverUrl != null
                                ? CachedNetworkImage(
                                    imageUrl: _newList[index]
                                        .coverUrl
                                        .toString(),
                                  )
                                : const Text('NO DATA'))
                      );
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
