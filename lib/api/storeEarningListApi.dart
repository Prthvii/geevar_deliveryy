import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spicy_food_delivery/Helper/network.dart';
import 'package:spicy_food_delivery/Helper/sharedPref.dart';


Future storeEarningListingApi() async {
  var token = await getSharedPrefrence('token');

  final response = await http.get(
      Uri.parse(
        baseUrl + 'delivery-boy/user/delivery/earning/list',
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
    convertDataToJson = 0;
    print("response.body");
    print(response.body);
  }
  return convertDataToJson;
}
