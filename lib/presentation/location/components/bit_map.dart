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

class _BitMapState extends State<BitMap> with SingleTickerProviderStateMixin {
  bool _loadCurLoc = false;
  Map<String, dynamic> _currPlace = {'name': ''};

  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController!.forward();
  }

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
            _currPlace['name'],
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

  Widget getMap() {
    _currPlace = _currPlace['name'] == '' ? widget.place : _currPlace;
    final latLng = LatLng(_currPlace['position'][0], _currPlace['position'][1]);

    return Center(
      child: FlutterMap(
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
      ),
    );
  }

  // Widget nearestPlace() {
  //   return Align(
  //     alignment: Alignment.bottomLeft,
  //     child: BottomSheet(
  //       animationController: _animationController,
  //       showDragHandle: true,
  //       onClosing: () {},
  //       builder: (context) {
  //         return Container(
  //           child: Text("data"),
  //         );
  //       },
  //     ),
  //   );
  // }

  bool isExpanded = false;

  Widget nearestPlace() {
    return Builder(builder: (context) {
      return Align(
        alignment: Alignment.topLeft,
        child: Container(
          width: getWidth(context),
          height: isExpanded ? 165 : 50,
          child: Column(
            children: [
              IconButton(
                onPressed: () => setState(() {
                  isExpanded = !isExpanded;
                }),
                icon: Icon(
                  isExpanded
                      ? Icons.arrow_drop_down_rounded
                      : Icons.arrow_drop_up_rounded,
                  size: 25,
                ),
              ),
              Expanded(
                child: Container(
                  width: getWidth(context),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          width: getWidth(context) - 36,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text("Nearest restroom"),
                          ),
                        ),
                        SizedBox(
                          width: getWidth(context) - 36,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text("Nearest wifi center"),
                          ),
                        ),
                        SizedBox(
                          width: getWidth(context) - 36,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text("Nearest place to eat"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Widget curLocBtn() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: IconButton(
          onPressed: () => getAndMarkUser(),
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(ColorAssets.bduColor),
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
    );
  }

  Widget smallLoadingSpinner() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        height: 45,
        width: 45,
        margin: const EdgeInsets.all(10),
        child: const Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
            color: ColorAssets.bduColor,
          ),
        ),
      ),
    );
  }

  void getAndMarkUser() async {
    setState(() {
      _loadCurLoc = true;
    });
    try {
      final position = await getUserLoc(context);
      if (position != null) {
        setState(() {
          _currPlace = {
            'name': 'Your Location',
            'description': "",
            'position': position,
          };
        });
      }
    } catch (error) {
      // already caught
    }
    setState(() {
      _loadCurLoc = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox(
          height: getHeight(context),
          width: getWidth(context),
          child: Center(
            child: Stack(
              children: [
                getMap(),
                nearestPlace(),
                _loadCurLoc ? smallLoadingSpinner() : curLocBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
