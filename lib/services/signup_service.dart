import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/signup_model.dart';


class signup_service extends GetxController {

  var data;
  var error = false.obs;
  Future signup_user(String email, String password) async {
    final response = await http.post(
      Uri.parse("http://10.125.11.117:8081/user/signup"),
      headers : {
        'accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: json.encode({
        'email' : email,
        'password' : password
      })
    );

    if(response.statusCode == 200)
      {
        print(json.decode(response.body));

        data = jsonDecode(response.body);
        error.value = data['error'];
        print("Printing error value from service:");
        print(error);

        return signup_person.fromJson(jsonDecode(response.body));
      }
    else
      {
        throw Exception("Failed to load resource");
      }
  }
}