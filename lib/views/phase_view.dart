// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel_api/views/splash_view.dart';

import 'detail_view.dart';

class PhaseView extends StatelessWidget {
  PhaseView({
    Key? key,
    required this.newList,
    required this.phase,
  }) : super(key: key);
  List newList;
  int phase;

  void initState() {
    mcuMoviesList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 36, 36, 36),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'MARVEL PHASE $phase ',
          style: const TextStyle(
              letterSpacing: 4, fontSize: 24, fontWeight: FontWeight.w800),
        ),
      ),
      body: mcuMoviesList.isNotEmpty
          ? GridView.builder(
              itemCount: newList.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: newList[index].coverUrl != null
                            ? InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => DetailView(
                                              url: newList[index].trailerUrl,
                                              desc: newList[index].overview,
                                              duration: newList[index]
                                                  .duration
                                                  .toString(),
                                              title: newList[index].title,
                                              date: newList[index].releaseDate,
                                              img: newList[index].coverUrl)));
                                },
                                child: CachedNetworkImage(
                                  imageUrl: newList[index].coverUrl.toString(),
                                ),
                              )
                            : const Text('NO DATA')));
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
