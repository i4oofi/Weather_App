import 'package:flutter/material.dart';
import 'package:weather/widgets/custom_text_field.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomTextField(),
      ),
    );
  }
}
