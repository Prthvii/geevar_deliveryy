import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spicy_food_delivery/Helper/common.dart';
import 'package:spicy_food_delivery/Helper/network.dart';
import 'package:spicy_food_delivery/Helper/sharedPref.dart';
import 'package:spicy_food_delivery/Helper/snackbar_toast_helper.dart';


Future newListingApi() async {
  var token = await getSharedPrefrence(Common1.TOKEN);

  final response = await http.get(
      Uri.parse(
        baseUrl + port4 + port + Orders + New,
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
    showToastSuccess("Something went wrong,check your internet connection");
    print("responseeeeeeeeeeee");
    print(response.body);

  }
  return convertDataToJson;
}
