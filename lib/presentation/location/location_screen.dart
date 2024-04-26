import 'package:bit_connect/presentation/location/components/bit_map.dart';
import 'package:bit_connect/presentation/location/components/loc_overview.dart';
import 'package:bit_connect/presentation/location/components/quick_search.dart';
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
      child: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => {
            QuickSearch.showQuickSearchWindow(context),
          },
          child: Container(
            margin: const EdgeInsets.only(top: 70),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: getWidth(context) - 40,
            height: 50,
            decoration: const BoxDecoration(
              color: Color.fromARGB(25, 0, 0, 0),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Search Places ...",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                ),
                Icon(
                  Icons.search,
                  size: 25,
                  color: Colors.black54,
                ),
              ],
            ),
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
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 235, 246, 255),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            place['name'],
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            place['description'],
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 145,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BitMap(place: place),
                    ),
                  );
                },
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(ColorAssets.bduColor),
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
                        Icons.map_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "see on map",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
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
                    searchBar(),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          const Text(
                            "Inside BiT",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => BitMap(place: bit),
                                ),
                              );
                            },
                            style: const ButtonStyle(
                              padding: MaterialStatePropertyAll(
                                EdgeInsets.all(5),
                              ),
                            ),
                            child: const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 5.0),
                                  child: Icon(
                                    Icons.map,
                                    color: ColorAssets.bduColor,
                                  ),
                                ),
                                Text(
                                  "Open Map",
                                  style: TextStyle(
                                    color: ColorAssets.bduColor,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
