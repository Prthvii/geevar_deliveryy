import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spicy_food_delivery/Helper/common.dart';
import 'package:spicy_food_delivery/Helper/network.dart';
import 'package:spicy_food_delivery/Helper/sharedPref.dart';
import 'package:spicy_food_delivery/Helper/snackbar_toast_helper.dart';

Future paySingleCodApi(iD) async {
  var token = await getSharedPrefrence(Common1.TOKEN);

  final response = await http.get(
      Uri.parse(
        baseUrl + "delivery-boy/user/cash-on-delivery/single/payment/online/"+iD.toString(),
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
    var msg = json.decode(response.body);
    showToastSuccess(msg['message'].toString());
    convertDataToJson = 0;

  }
  print(response.body);
  return convertDataToJson;
}
