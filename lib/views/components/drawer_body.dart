import 'package:flutter/material.dart';

import '../home_view.dart';
import '../phase_view.dart';
import '../splash_view.dart';

List newList = [];
Widget drawerBody(String title, BuildContext context, int phases) {
  return Column(
    children: [
      ListTile(
        title: Text(
          title,
          style: const TextStyle(
              letterSpacing: 5, fontSize: 28, fontWeight: FontWeight.w900),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.arrow_forward_ios_rounded),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (_) => PhaseView(
                        phase: phases,
                        newList: newList = mcuMoviesList
                            .where((item) => item.phase == phases)
                            .toList())));
          },
        ),
      ),
    ],
  );
}
