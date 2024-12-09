import 'package:flutter/material.dart';
import 'package:weather/widgets/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: HomeBody(),
    );
  }
}
