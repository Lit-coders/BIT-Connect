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
  LatLng _center = const LatLng(11.597621756651337, 37.39551835806901);
  String _layerCode = 'm';
  Map<String, dynamic>? _nearestPlace;

  MapController? _mapController;

  @override
  void initState() {
    _mapController = MapController();

    super.initState();
  }

  void _flyTo(latLng) {
    _mapController!.move(latLng, _mapController!.camera.zoom);
  }

  Widget getMap() {
    return Center(
      child: FlutterMap(
        mapController: _mapController!,
        options: MapOptions(
          initialCenter: _center,
          initialZoom: 16,
          onTap: (tapPosition, point) => _flyTo(point),
        ),
        children: [
          TileLayer(
            urlTemplate:
                'http://{s}.google.com/vt?lyrs=$_layerCode&x={x}&y={y}&z={z}',
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
              // mark center
              Marker(
                point: _center,
                width: 200,
                height: 100,
                child: placeMarker(_currPlace),
              ),
              // mark nearest place
              if (_nearestPlace != null)
                Marker(
                  point: LatLng(
                    _nearestPlace!['position'][0],
                    _nearestPlace!['position'][1],
                  ),
                  width: 200,
                  height: 100,
                  child: placeMarker(_nearestPlace!),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget placeMarker(place) {
    // if (_mapController != null) {
    //   _flyTo(_center);
    // }
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Text(
            place['name'],
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

  Widget getLayerTab(name, code) {
    return Container(
      width: 150,
      padding: const EdgeInsets.only(bottom: 3),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            _layerCode == code
                ? const Color.fromARGB(165, 87, 172, 246)
                : const Color.fromARGB(50, 87, 172, 246),
          ),
          shadowColor: const MaterialStatePropertyAll(Colors.transparent),
          padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          ),
        ),
        onPressed: () => setState(() {
          _layerCode = code;
          isLayerBoxExpanded = false;
        }),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: Image(
                image: AssetImage('assets/layers/$name.png'),
                fit: BoxFit.cover,
                width: 30,
                height: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(name),
            ),
          ],
        ),
      ),
    );
  }

  bool isLayerBoxExpanded = false;

  Widget mapLayer() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        height: isLayerBoxExpanded ? 220 : 0,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 100, right: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              getLayerTab('default', 'm'),
              getLayerTab('hybrid', 's,h'),
              getLayerTab('satellite', 's'),
              getLayerTab('terrain', 'p'),
            ],
          ),
        ),
      ),
    );
  }

  Widget layerBtn() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: const EdgeInsets.only(right: 10, top: 50),
        child: IconButton(
          onPressed: () => setState(() {
            isLayerBoxExpanded = !isLayerBoxExpanded;
          }),
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(ColorAssets.bduColor),
            padding: MaterialStatePropertyAll(
              EdgeInsets.all(5),
            ),
          ),
          icon: Icon(
            isLayerBoxExpanded ? Icons.close : Icons.layers,
            size: 25,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void showNearest(category) {
    for (var place in places) {
      if (place['category'] == category) {
        List nearest =
            getNearest(place['places'], [11.59559775563384, 37.39580471521378]);
        setState(() {
          _nearestPlace = nearest[0];
        });
        print(
            'nearest $category is ${nearest[0]['name']} with distance ${nearest[1]}');
      }
    }
  }

  bool isExpanded = false;

  Widget nearestPlace() {
    return Builder(builder: (context) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: getWidth(context) * 3 / 4,
          height: isExpanded ? 170 : 0,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 65, right: 30),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: getWidth(context) - 36,
                  child: ElevatedButton(
                    onPressed: () => showNearest('Lounges'),
                    child: const Text("Nearest Lounges"),
                  ),
                ),
                SizedBox(
                  width: getWidth(context) - 36,
                  child: ElevatedButton(
                    onPressed: () => showNearest('dormitories'),
                    child: const Text("Nearest dormitories"),
                  ),
                ),
                SizedBox(
                  width: getWidth(context) - 36,
                  child: ElevatedButton(
                    onPressed: () => showNearest('Cafes'),
                    child: const Text("Nearest Cafes"),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget nearestPlaceBtn() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
        child: IconButton(
          onPressed: () => setState(() {
            isExpanded = !isExpanded;
          }),
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(ColorAssets.bduColor),
            padding: MaterialStatePropertyAll(
              EdgeInsets.all(5),
            ),
          ),
          icon: Icon(
            isExpanded ? Icons.close : Icons.directions_walk,
            size: 25,
            color: Colors.white,
          ),
        ),
      ),
    );
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
          _center =
              LatLng(_currPlace['position'][0], _currPlace['position'][1]);
        });

        // _mapController = MapController();
        // if (_mapController != null) {
        //   _mapController!.move(LatLng(position[0], position[1]), 16);
        // }
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
    _currPlace = _currPlace['name'] == '' ? widget.place : _currPlace;
    _center = LatLng(_currPlace['position'][0], _currPlace['position'][1]);

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
                mapLayer(),
                layerBtn(),
                nearestPlace(),
                nearestPlaceBtn(),
                _loadCurLoc ? smallLoadingSpinner() : curLocBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
