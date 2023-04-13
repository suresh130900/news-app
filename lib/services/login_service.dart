import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/login_model.dart';

class login_service extends GetxController{
  var success;

  var error = false.obs;

  Future<login_person> verify_login(String email, String password) async {
    final response = await http.post(
        Uri.parse("http://10.125.11.117:8081/user/login"),
        headers : {
          'accept': 'application/json',
          'Content-Type': 'application/json'
      },
      body: json.encode({
        "email" : email,
        "password" : password
      })
    );
    if(response.statusCode == 200)
      {
        print(jsonDecode(response.body));

        success = jsonDecode(response.body);
        error.value = success['error'];

        return login_person.fromJson(jsonDecode(response.body));
      }
    else {
      print(response.statusCode);
      print(response.body);
      throw Exception("Failed to Load Resource");
    }
  }
}