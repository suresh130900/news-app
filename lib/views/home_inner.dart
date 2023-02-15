
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
  List<String> categories = ["World","Business","Sports","Tech","HealthCare","Science"];

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
                      child: news1[index].urlToImage != null ? Image(
                        image: NetworkImage(news1[index].urlToImage),
                      ) : Image.network(
                        "https://thumbs.dreamstime.com/b/world-technology-science-news-background-connection-digital-wires-circle-dots-map-143218024.jpg",
                        height: 300,
                        width: 120,
                      ),
                    );
                  },
              ),
            ),
            Container(
              height: 60,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index){
                  return  Container(
                      width: 90,
                      child: GestureDetector(
                        onTap: () {
                          print(categories[index]);
                        },
                        child: Chip(
                          padding: EdgeInsets.all(8),
                          elevation: 20,
                          shadowColor: Colors.black,
                          label: Text(
                            categories[index],
                            style: TextStyle(
                                color: Colors.amberAccent.shade100
                            ),
                          ),
                        ),
                      ),
                    );
                },
              ),
            ),
            Container(
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: news1.length,
                  itemBuilder: (BuildContext context, int i) {
                    return ListTile(
                      onTap: (){
                        print(news1[i].title);
                      },
                      leading: Container(
                        child: news1[i].urlToImage != null ? Image.network(
                          news1[i].urlToImage.toString(),
                          height: double.infinity,
                          width: 120,
                          fit: BoxFit.cover,
                        ) : Image.network(
                          "https://thumbs.dreamstime.com/b/world-technology-science-news-background-connection-digital-wires-circle-dots-map-143218024.jpg",
                          height: 300,
                          width: 120,
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
        urlToImage = json['urlToImage'] == null ? null : json['urlToImage'],
        publishedAt = json['publishedAt'],
        content = json['content'],
        name = json['name'],
        source  = json['source'];
}
