import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/views/search_page.dart';

class FailureBody extends StatelessWidget {
  const FailureBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/images/errorr.json', height: 150),
                const SizedBox(height: 20),
                Text(
                  "The city ain't on the map",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                  ),
                  child: const Text(
                    'Hit it up again, bro! ',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
