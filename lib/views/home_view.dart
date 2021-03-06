import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel_api/views/detail_view.dart';
import 'package:marvel_api/views/splash_view.dart';

import 'components/drawer_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomRight: Radius.circular(40))),
          child: Column(children: [
            DrawerHeader(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Spacer(),
                    Text(
                      'MARVEL PHASES',
                      style: TextStyle(
                          letterSpacing: 5,
                          fontSize: 24,
                          fontWeight: FontWeight.w900),
                    ),
                    Spacer(),
                  ],
                ),
              ],
            )),
            drawerBody('Phase 1', context, 1),
            drawerBody('Phase 2', context, 2),
            drawerBody('Phase 3', context, 3),
            drawerBody('Phase 4', context, 4),
          ])),
      appBar: AppBar(
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
                          ? InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => DetailView(
                                            url:
                                                mcuMoviesList[index].trailerUrl,
                                            desc: mcuMoviesList[index].overview,
                                            duration: mcuMoviesList[index]
                                                .duration
                                                .toString(),
                                            title: mcuMoviesList[index].title,
                                            date: mcuMoviesList[index]
                                                .releaseDate,
                                            img: mcuMoviesList[index]
                                                .coverUrl)));
                              },
                              child: CachedNetworkImage(
                                imageUrl:
                                    mcuMoviesList[index].coverUrl.toString(),
                              ),
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
            )),
    );
  }
}
