import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/news_model.dart';

class category_news extends GetxController{
  bool loading = false;

  RxList<NewsModel> cat = <NewsModel>[].obs;
  Future get_news(String category) async{
    loading = true;

    const api_key = "b23bfed3b089427988cda197c8292b52";
    var api_endpoint = "";
    if (category.isEmpty) {
      api_endpoint =
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=$api_key";
    } else {
      api_endpoint =
      "https://newsapi.org/v2/everything?q=$category&apiKey=$api_key";
    }

    print("Printing the category from the category_news");
    print(category);
    final response = await http.get(Uri.parse(api_endpoint));

    List<NewsModel> news_fetched =
    (jsonDecode(response.body)["articles"] as List)
        .map((data) => NewsModel.fromJson(data))
        .toList();

    cat.value = news_fetched;

    loading = false;
  }
}