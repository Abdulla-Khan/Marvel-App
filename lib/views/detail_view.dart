// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  DetailView(
      {Key? key,
      required this.img,
      required this.title,
      required this.date,
      this.desc,
      this.duration})
      : super(key: key);
  String? img;
  String? title;
  String? date;
  String? duration;
  String? desc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              height: MediaQuery.of(context).size.height / 1.4,
              width: double.infinity,
              child: Image(
                image: NetworkImage(img!),
                fit: BoxFit.cover,
              ),
            ),
            Text('Title : $title'),
            Text('Release Date : $date'),
            Text('Run Time: $duration minutes'),
            Text('Description: $desc')
          ],
        ),
      ),
    );
  }
}
