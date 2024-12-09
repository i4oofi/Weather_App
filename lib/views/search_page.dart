import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather/widgets/search_body.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Align(
          alignment: const AlignmentDirectional(3, -0.3),
          child: Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.deepPurple),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(-3, -0.3),
          child: Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.deepPurple),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0, -1.2),
          child: Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(color: Color(0xFFFFAB40)),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
          child: Container(
            decoration: const BoxDecoration(color: Colors.transparent),
          ),
        ),
        const SearchBody(),
      ]),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const Text(
          'Search',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
