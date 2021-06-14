import 'dart:async';
import 'dart:convert';
import 'package:flutter_projects/constants.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  // final String url;

  // NetworkHelper(this.url);

  Future getData() async {
    http.Response response;
    try {
      response = await http
          .get(Uri.parse(kThinkReadUrl))
          .timeout(const Duration(seconds: 12));
      if (response.statusCode == 200) {
        String data = response.body;

        return jsonDecode(data);
      } else {
        String data = response.body;
        print(data);
        return jsonDecode(data);
      }
    } on TimeoutException {
      String data = '\"cod": "404", "message": "city not found\"';

      return jsonDecode(data);
    } on Error {
      String data = {"cod": "404", "message": "city not found 2"} as String;

      return jsonDecode(data);
    }
  }
}
