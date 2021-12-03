import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spicy_food_delivery/Helper/network.dart';
import 'package:spicy_food_delivery/Utils/geoLoaction.dart';

Future enterNumberApi(num) async {
  var loc = await determinePosition();

  final response = await http.post(
    Uri.parse(
      baseUrl + port4 + port + enterNum,
    ),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(<String, String>{
      // 'cart_id': strId,
      'phoneCode': "+91",
      'phoneNumber': num.toString(),
      "latitude": loc[0].toString(),
      "longitude": loc[1].toString()
    }),
  );
  var convertDataToJson;

  if (response.statusCode == 200) {
    convertDataToJson = json.decode(response.body);
    // If the server did return a 200 OK response,
    // then parse the JSON.
  } else {
    convertDataToJson = json.decode(response.body);
  }

  return convertDataToJson;
}
