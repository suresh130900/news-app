
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class news {
  static Future<Map> getJson() async {
    const api_key = "b23bfed3b089427988cda197c8292b52";
    const api_endpoint =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=$api_key";
    final apiResponse = await http.get(Uri.parse(api_endpoint));
    return json.decode(apiResponse.body);
  }
}


class HomeInner extends StatefulWidget {
  const HomeInner({Key? key}) : super(key: key);

  @override
  State<HomeInner> createState() => _HomeInnerState();
}

class _HomeInnerState extends State<HomeInner> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  List<NewsModel> news1 = <NewsModel>[];

  fetchMovies() async {
    var data = await news.getJson();

    setState(() {
      List<dynamic> results = data['articles'];
      results.forEach((element) {
        news1.add(NewsModel.fromJson(element));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    fetchMovies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Container(
              child: const Text(
                "News",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
            SizedBox(
              height: 250,
              child: PageView.builder(
                  itemCount: news1.length - 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder:
                      (BuildContext context,int index) {
                    return Container(
                      height: 100,
                      child: Image(
                        image: NetworkImage(news1[index].urlToImage),
                      ),
                    );
                  }),
            ),

            Container(
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: news1.length,
                  itemBuilder: (BuildContext context, int i) {
                    return ListTile(
                      leading: SizedBox(
                        height: 200,
                        child: Image.network(
                          news1[i].urlToImage.toString(),
                          height: 200,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        news1[i].title.toString(),
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      subtitle: Text(
                        news1[i].publishedAt.toString(),
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}


class NewsModel {
  var title;
  var author;
  var description;
  var url;
  var urlToImage;
  var publishedAt;
  var content;
  var name;
  var source;

  NewsModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        author = json['author'],
        description = json['description'],
        url = json['url'],
        urlToImage = json['urlToImage'],
        publishedAt = json['publishedAt'],
        content = json['content'],
        name = json['name'],
        source  = json['source'];
}
