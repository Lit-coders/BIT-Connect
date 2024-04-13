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
  List _selectedPlace = places[0]['places'];
  int _selectedPlaceIndex = 0;

  Widget getPlaceTab(dynamic place, int index) {
    return GestureDetector(
      onTap: () => setState(() {
        _selectedPlace = place['places'];
        _selectedPlaceIndex = index;
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: _selectedPlaceIndex == index
              ? const Color.fromARGB(224, 187, 222, 251)
              : const Color.fromARGB(255, 235, 246, 255),
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

  Widget searchBar() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.only(top: 70),
        width: getWidth(context) - 40,
        child: const TextField(
          style: TextStyle(
            fontSize: 20,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(31, 171, 167, 167),
            hintText: 'Search Places ...',
            hintStyle: TextStyle(
              color: Colors.black45,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
          ),
        ),
      ),
    );
  }

  Widget getPlaceCard(place) {
    return Container(
      width: getWidth(context) - 36,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 235, 246, 255),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            place['name'],
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            place['description'],
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            width: 156,
            child: ElevatedButton(
              onPressed: () {
                print(place['description']);
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(ColorAssets.bduColor),
                overlayColor: MaterialStatePropertyAll(Colors.transparent),
                shadowColor: MaterialStatePropertyAll(Colors.transparent),
                padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                ),
              ),
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Icon(
                      Icons.map,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "see on map",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Text(
                        "Inside BiT",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    searchBar(),
                    Align(
                      child: Container(
                        padding:
                            EdgeInsets.only(top: getHeight(context) * 1 / 6),
                        child: Column(
                          children: [
                            SizedBox(
                              width: getWidth(context),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Wrap(
                                  spacing: 10,
                                  children: _places
                                      .map((
                                        place,
                                      ) =>
                                          getPlaceTab(
                                              place, _places.indexOf(place)))
                                      .toList(),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 20,
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Wrap(
                                    direction: Axis.vertical,
                                    spacing: 10,
                                    children: _selectedPlace
                                        .map((place) => getPlaceCard(place))
                                        .toList(),
                                  ),
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
