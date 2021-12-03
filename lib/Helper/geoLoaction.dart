import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:spicy_food_delivery/Helper/snackbar_toast_helper.dart';

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return 0;
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.

    bool permission = await Geolocator.openAppSettings();
    showToastSuccess(
        "Location permissions are permanently denied by Android , we cannot request permissions. Open location in app setting and turn on");
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }
  print("laaaaaaaat");

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.

  // Position currentLocation = await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.best,
  //     );

  _locationData = await location.getLocation();

  var rsp = [_locationData.latitude, _locationData.longitude];
  print("laaaaaaaat");
  print(rsp);
  return rsp;
}

Future determinePosition2() async {
  bool serviceEnabled;
  LocationPermission permission;

  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return 0;
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.

    bool permission = await Geolocator.openAppSettings();
    showToastSuccess(
        "Location permissions are permanently denied by Android , we cannot request permissions. Open location in app setting and turn on");
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }
  print("laaaaaaaat");

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.

  // Position currentLocation = await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.best,
  //     );

  _locationData = await location.getLocation();

  var rsp = [_locationData.latitude, _locationData.longitude];
  print("laaaaaaaat");
  print(rsp);
  return rsp;
}

Future calculateDistance(
    startLatitude, startLongitude, endLatitude, endLongitude) async {
  final distance = Geolocator.distanceBetween(
      startLatitude, startLongitude, endLatitude, endLongitude);

  var toMeter = int.parse(distance.toStringAsFixed(0).toString());
  var km = toMeter / 1000;

  return km.toStringAsFixed(1).toString();
}

calculateCircle(startLatitude, startLongitude, endLatitude, endLongitude) {
  final distance = Geolocator.distanceBetween(
      startLatitude, startLongitude, endLatitude, endLongitude);

  var toMeter = int.parse(distance.toStringAsFixed(0).toString());
  var km = toMeter / 1000;

  print("toMeter");
  print(startLatitude);
  return km.toStringAsFixed(1).toString();
}

Future getTime(dist) {
  var time = dist * 60;
  return time;
}
