import 'package:bit_connect/searvices/data/place_list.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class BitMap extends StatefulWidget {
  Map<String, dynamic> place;
  BitMap({super.key, required this.place});

  @override
  State<BitMap> createState() => _BitMapState();
}

class _BitMapState extends State<BitMap> {
  Widget placeMarker() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Text(
            widget.place['name'],
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Icon(
          Icons.place,
          size: 30,
          color: ColorAssets.bduColor,
        ),
      ],
    );
  }

  FlutterMap getMap() {
    final latLng =
        LatLng(widget.place['position'][0], widget.place['position'][1]);
    return FlutterMap(
      options: MapOptions(
        initialCenter: latLng,
        initialZoom: 16,
      ),
      children: [
        TileLayer(
          urlTemplate: 'http://{s}.google.com/vt?lyrs=s&x={x}&y={y}&z={z}',
          subdomains: const ["mt0", "mt1", "mt2", "mt3"],
        ),
        PolygonLayer(
          polygons: [
            Polygon(
              points: bitBorders,
              borderColor: Colors.blue,
              borderStrokeWidth: 5,
              isDotted: true,
              color: const Color.fromARGB(42, 33, 149, 243),
              isFilled: true,
            ),
          ],
        ),
        MarkerLayer(
          rotate: false,
          markers: [
            Marker(
              point: latLng,
              width: 200,
              height: 100,
              child: placeMarker(),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          height: getHeight(context),
          width: getWidth(context),
          child: Center(
            child: Stack(
              children: [
                Center(
                  child: getMap(),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: IconButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(ColorAssets.bduColor),
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.all(5),
                        ),
                      ),
                      icon: const Icon(
                        Icons.my_location,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
