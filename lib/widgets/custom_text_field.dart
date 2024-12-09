import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/weather_cubit.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  List<String> citySuggestions = [];

  // دالة لتحميل المدن من ملف JSON
  Future<void> loadCities() async {
    final String response =
        await rootBundle.loadString('assets/images/cities.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      citySuggestions = data.map((city) => city['name'] as String).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    loadCities();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<WeatherCubit>(context).weatherModel?.getColor();
    var cityName = BlocProvider.of<WeatherCubit>(context).cityName;

    return Stack(
      children: [
        BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text.isEmpty) {
                      return const Iterable<String>.empty();
                    }
                    return citySuggestions.where(
                      (city) => city
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase()),
                    );
                  },
                  onSelected: (String selectedCity) {
                    BlocProvider.of<WeatherCubit>(context)
                        .weatherManage(selectedCity);
                    Navigator.pop(context);
                  },
                  fieldViewBuilder: (BuildContext context,
                      TextEditingController textEditingController,
                      FocusNode focusNode,
                      VoidCallback onFieldSubmitted) {
                    return TextField(
                      onSubmitted: (data) {
                        cityName = data;
                        BlocProvider.of<WeatherCubit>(context)
                            .weatherManage(cityName);
                        Navigator.pop(context);
                      },
                      controller: textEditingController,
                      focusNode: focusNode,
                      cursorColor: const Color.fromARGB(255, 51, 66, 73),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 51, 66, 73),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.location_city,
                            color: Colors.blueGrey,
                            size: 24,
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                            width: 1.1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 16),
                        hintText: 'Enter city name',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 14,
                        ),
                        label: const Text(
                          'Search',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    );
                  },
                  optionsViewBuilder: (BuildContext context,
                      AutocompleteOnSelected<String> onSelected,
                      Iterable<String> options) {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Material(
                        elevation: 4.0,
                        child: SizedBox(
                          height: 600.0, // التحكم في ارتفاع القائمة
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: ListView.builder(
                            padding: EdgeInsets.zero, // إزالة padding الزائد
                            itemCount: options.length,
                            itemBuilder: (BuildContext context, int index) {
                              final option = options.elementAt(index);

                              return GestureDetector(
                                onTap: () {
                                  onSelected(option);
                                },
                                child: InkWell(
                                  onTap: () {
                                    onSelected(option);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 3,
                                          offset: const Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        option,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
