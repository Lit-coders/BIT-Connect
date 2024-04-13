import 'package:bit_connect/presentation/location/components/loc_overview.dart';
import 'package:bit_connect/searvices/data/place_list.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final _places = places;
  List _selectedPlace = [];

  Widget getPlaceTab(dynamic place) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Text(
          place['category'],
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget getPlaceCard(place) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Text(
          place['category'],
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _selectedPlace = _places[0]['places'];
    });
    return SafeArea(
      child: Container(
        width: getWidth(context),
        height: getHeight(context),
        color: ColorAssets.bduColor,
        child: Column(
          children: [
            const LocOverview(),
            Expanded(
              child: Container(
                width: getWidth(context),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: getWidth(context) * 3 / 4 + 20,
                        child: const TextField(
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black12,
                            hintText: 'Search Places ...',
                            hintStyle: TextStyle(
                              color: Colors.black45,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      child: Container(
                        padding:
                            EdgeInsets.only(top: getHeight(context) * 1 / 10),
                        child: Column(
                          children: [
                            SizedBox(
                              width: getWidth(context),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Wrap(
                                  spacing: 10,
                                  children: _places
                                      .map((place) => getPlaceTab(place))
                                      .toList(),
                                ),
                              ),
                            ),
                            Container(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Wrap(
                                  spacing: 10,
                                  children: _selectedPlace
                                      .map((place) => getPlaceCard(place))
                                      .toList(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}