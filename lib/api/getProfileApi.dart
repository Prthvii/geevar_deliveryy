import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spicy_food_delivery/Helper/network.dart';
import 'package:spicy_food_delivery/Helper/sharedPref.dart';
import 'package:spicy_food_delivery/Helper/snackbar_toast_helper.dart';

Future getProfileApi() async {
  var token = await getSharedPrefrence('token');

  final response = await http.get(
      Uri.parse(
        baseUrl + port4 + port + profile,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + token
      });
  var convertDataToJson;

  if (response.statusCode == 200) {
    convertDataToJson = json.decode(response.body);

    // If the server did return a 200 OK response,
    // then parse the JSON.
  } else {
    convertDataToJson = null;

    showToastSuccess("Something went wrong! Check your internet connection");
  }
  return convertDataToJson;
}
