import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spicy_food_delivery/Helper/common.dart';
import 'package:spicy_food_delivery/Helper/network.dart';
import 'package:spicy_food_delivery/Helper/sharedPref.dart';
import 'package:spicy_food_delivery/Helper/snackbar_toast_helper.dart';

Future locationUpdateApi(lat, long) async {
  var token = await getSharedPrefrence(Common1.TOKEN);

  final response = await http.post(
    Uri.parse(
      baseUrl + port4 + port + updateLocation,
    ),
    headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + token
    },
    body: jsonEncode(<String, String>{
      // 'cart_id': strId,

      'latitude': lat.toString(),
      'longitude': long.toString(),
    }),
  );
  var convertDataToJson;

  if (response.statusCode == 200) {
    convertDataToJson = json.decode(response.body);
    // If the server did return a 200 OK response,
    // then parse the JSON.
  } else {
    convertDataToJson = 0;
    showToastSuccess("Something went wrong! Check your internet connection");
  }
  return convertDataToJson;
}
