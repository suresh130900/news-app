import 'dart:convert';

import 'package:get/get.dart';
import 'package:news_app/model/news_model.dart';
import 'package:http/http.dart' as http;

class news extends GetxController {
  RxList<NewsModel> nml = <NewsModel>[].obs;
  bool loading = false;

  Future get_news(String countryb) async {
    loading = true;
    const api_key = "b23bfed3b089427988cda197c8292b52";
    var api_endpoint = "";
    if (countryb.isEmpty) {
      api_endpoint =
          "https://newsapi.org/v2/top-headlines?country=in&apiKey=$api_key";
    } else {
      api_endpoint =
          "https://newsapi.org/v2/everything?q=$countryb&apiKey=$api_key";
    }

    final apiResponse = await http.get(Uri.parse(api_endpoint));
    List<NewsModel> news_fetched =
        (jsonDecode(apiResponse.body)["articles"] as List)
            .map((data) => NewsModel.fromJson(data))
            .toList();

    nml.value = news_fetched;
    loading = false;
  }
}
