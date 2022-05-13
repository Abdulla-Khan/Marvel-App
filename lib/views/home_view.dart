import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marvel_api/model/marvel_model.dart';
import 'package:marvel_api/views/detail_view.dart';
import 'package:marvel_api/views/phase_view.dart';

import 'components/drawer_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

var marvelApiUrl = "https://mcuapi.herokuapp.com/api/v1/movies";
List<McuModels> mcuMoviesList = [];

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getMarvelMovies();
  }




 
List newList=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        shape: RoundedRectangleBorder(
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
                letterSpacing: 5, fontSize: 24, fontWeight: FontWeight.w900),
          ),
                  Spacer(),
                  
                ],
              ),
            ],
          )),
          
             drawerBody('Phase 1',context,1),
             drawerBody('Phase 2', context,2),
             drawerBody('Phase 3', context,3),
             drawerBody('Phase 4', context,4),

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
                                              desc:
                                                  mcuMoviesList[index].overview,
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

void getMarvelMovies() {
  debugPrint('=========== Function running =============');

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
  }).catchError((err) {
    debugPrint('=========== $err =============');
  });
}
