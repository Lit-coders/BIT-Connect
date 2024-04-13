import 'package:bit_connect/presentation/auth/components/error_snack_bar.dart';
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

Future<List?> getUserLoc(context) async {
  try {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // request for permission
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permission still denied
        final snackBar = ErrorSnackBar(
            content:
                "User denied to grant permission of sharing device's location, Sorry!");
        ScaffoldMessenger.of(context).showSnackBar(snackBar.getSnackBar());
        return null;
      }
    }

    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return [position.latitude, position.longitude];
  } catch (error) {
    final snackBar =
        ErrorSnackBar(content: "Unable to locate user, Please try again?");
    ScaffoldMessenger.of(context).showSnackBar(snackBar.getSnackBar());
    return null;
  }
}
