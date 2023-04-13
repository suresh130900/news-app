import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/services/category_news.dart';
import 'package:url_launcher/url_launcher.dart';

class categories_data extends StatefulWidget {
  const categories_data({Key? key}) : super(key: key);

  @override
  State<categories_data> createState() => _categories_dataState();
}

class _categories_dataState extends State<categories_data> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  category_news cat_news = Get.put(category_news());

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    cat_news.get_news("");
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
          children: [
            Container(
              child: Obx(
                    () => ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cat_news.cat.length,
                    itemBuilder: (BuildContext context, int i) {
                      return GestureDetector(
                        onTap: () {
                          print(cat_news.cat[i].url.toString());
                          launchUrl(Uri.parse(cat_news.cat[i].url));
                        },
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                child: cat_news.cat[i].urlToImage != null
                                    ? Image.network(
                                    cat_news.cat[i].urlToImage.toString())
                                    : Image.network(
                                  "https://thumbs.dreamstime.com/b/world-technology-science-news-background-connection-digital-wires-circle-dots-map-143218024.jpg",
                                  height: 310,
                                  width: 420,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                child: Text(
                                  cat_news.cat[i].title,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                child: Text(
                                  cat_news.cat[i].publishedAt,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
