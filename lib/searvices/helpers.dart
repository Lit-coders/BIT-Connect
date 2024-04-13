import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

double getWidth(context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(context) {
  return MediaQuery.of(context).size.height;
}

// getting user location
// 1. to locate and mark devices's location
// 2. to locate and mark nearest desired places from the device's current location

Future<void> getUserLoc() async {
  try {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    print(position);
  } catch (error) {
    print("error while locating user: $error");
  }
}
