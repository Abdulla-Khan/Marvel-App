import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel_api/controller/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getMarvelMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 36, 36, 36),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 36, 36, 36),
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'MARVEL',
            style: TextStyle(
                letterSpacing: 5, fontSize: 28, fontWeight: FontWeight.w900),
          ),
        ),
        body: mcuMoviesList.isNotEmpty
            ? GridView.builder(
                itemCount: mcuMoviesList.length,
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
                        child: mcuMoviesList[index].coverUrl != null
                            ? CachedNetworkImage(
                                imageUrl:
                                    mcuMoviesList[index].coverUrl.toString(),
                              )
                            : const Text('')),
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
              )));
  }
}
