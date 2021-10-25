import 'package:http/http.dart' as http;
import 'package:spicy_food_delivery/Helper/common.dart';
import 'package:spicy_food_delivery/Helper/network.dart';
import 'package:spicy_food_delivery/Helper/sharedPref.dart';
import 'package:spicy_food_delivery/Helper/snackbar_toast_helper.dart';

Future statusApi(stat) async {
  var token = await getSharedPrefrence(Common1.TOKEN);
  Map<String, String> queryParameters = {
    'isAvailable': stat.toString(),
  };

  String queryString = Uri(queryParameters: queryParameters).query;

  final response = await http.get(
      Uri.parse(
        baseUrl + port4 + port + status + '?' + queryString,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + token
      });
  var convertDataToJson;

  if (response.statusCode == 200) {
    convertDataToJson = stat.toString();

    var staus = await sharedPrefrence(Common1.STATUS, stat.toString());
    // If the server did return a 200 OK response,
    // then parse the JSON.

    showToastSuccess("Status updated!");
  } else {
    convertDataToJson = null;
    print("response.body");
    print(response.body);
    showToastSuccess("Something went wrong! Check your internet connection");
  }
  return convertDataToJson;
}
