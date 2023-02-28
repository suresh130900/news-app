import 'dart:convert';
import 'package:get/get.dart';
import 'package:news_app/model/news_model.dart';
import 'package:http/http.dart' as http;


//this is the class that is calling the API
class news extends GetxController {
  RxList<NewsModel> nml = <NewsModel>[].obs;
  bool loading = false;

  //we are creating this so that we can access the Top Headlines data
  RxList<NewsModel> top = <NewsModel>[].obs;

  //creating a function to call the API
  Future get_news(String countryb) async {
    loading = true;

    //this is the API key
    const api_key = "b23bfed3b089427988cda197c8292b52";

    var api_endpoint = "";
    if (countryb.isEmpty) {
      api_endpoint =
          "https://newsapi.org/v2/top-headlines?country=in&apiKey=$api_key";
    } else {
      api_endpoint =
          "https://newsapi.org/v2/everything?q=$countryb&apiKey=$api_key";
    }

    //this is GET method and all the API Data will be Visible in the URL
    final apiResponse = await http.get(Uri.parse(api_endpoint));

    List<NewsModel> news_fetched =
        (jsonDecode(apiResponse.body)["articles"] as List)
            .map((data) => NewsModel.fromJson(data))
            .toList();

    nml.value = news_fetched;
    loading = false;


    var top_headline_api = "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=$api_key";
    final top_response = await http.get(Uri.parse(top_headline_api));
    List<NewsModel> top_headlines =
    (jsonDecode(top_response.body)["articles"] as List)
        .map((e) => NewsModel.fromJson(e))
        .toList();

    top.value = top_headlines;
  }

  // top_headlines() {
  //   var top_headline_api = "https://newsapi.org/v2/top-headlines?country=in&apiKey=$api_key";
  // }
}
