// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailView extends StatefulWidget {
  DetailView(
      {Key? key,
      required this.img,
      required this.title,
      required this.date,
      required this.url,
      this.desc,
      this.duration})
      : super(key: key);
  String? img;
  String? title;
  String? date;
  String? duration;
  String? desc;
  String? url;
  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  bool read = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.4,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                image: DecorationImage(
                    image: NetworkImage('${widget.img}'), fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title: ${widget.title}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Release Date: ${widget.date}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Description:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  buildText(widget.desc ?? 'Not Available'),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          read = !read;
                        });
                      },
                      child: Text(
                        (read ? 'Read Less' : 'Read More'),
                        style: TextStyle(color: Colors.grey),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        _launch(widget.url ??
                                "https://github.com/Abdulla-Khan") ??
                            '';
                      },
                      child: Text('Watch Trailer'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _launch(String url) async {
    if (await launch(url)) {
      await launch(url);
    } else {
      throw "Could'nt Launch";
    }
  }

  Widget buildText(String text) {
    final lines = read ? null : 3;
    return Text(
      text,
      style: Theme.of(context).textTheme.labelLarge,
      maxLines: lines,
      overflow: read ? TextOverflow.visible : TextOverflow.ellipsis,
    );
  }
}
