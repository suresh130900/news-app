import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:news_app/services/news.dart';

class HomeInner extends StatefulWidget {
  const HomeInner({Key? key}) : super(key: key);

  @override
  State<HomeInner> createState() => _HomeInnerState();
}

class _HomeInnerState extends State<HomeInner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  //this is Creating an Instance
  news n = Get.put(news());

  List<String> categories = [
    "World",
    "Business",
    "Sports",
    "Tech",
    "HealthCare",
    "Science"
  ];

 static var selected;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    // fetchMovies();
    n.get_news("");
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
                    color: Colors.black),
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 2,
            ),
            Text("Headlines",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 250,
              child: Obx(() => PageView.builder(
                    itemCount: n.nml.length - 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          // print(n.nml[index].url.toString());
                          launchUrl(Uri.parse(n.top[index].url));

                          print(n.top[index].url);
                        },
                        child: Container(
                          height: 100,

                          child: n.top[index].urlToImage != null
                          ? Image(
                            image:NetworkImage(n.top[index].urlToImage),
                          )
                              :Image.network(
                      "https://thumbs.dreamstime.com/b/world-technology-science-news-background-connection-digital-wires-circle-dots-map-143218024.jpg",
                              height: 300,
                               width: 120,
                          ),
                          // child: n.nml[index].urlToImage != null
                          //     ? Image(
                          //         image: NetworkImage(n.nml[index].urlToImage),
                          //       )
                          //     : Image.network(
                          //         "https://thumbs.dreamstime.com/b/world-technology-science-news-background-connection-digital-wires-circle-dots-map-143218024.jpg",
                          //         height: 300,
                          //         width: 120,
                          //       ),
                        ),
                      );
                    },
                  )),
            ),
            Container(
              height: 60,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 90,
                    child: GestureDetector(
                      onTap: () {
                        selected = categories[index];
                        print("printing the Selected Text");
                        print(selected);
                        n.get_news(categories[index]);
                        print(categories[index]);
                      },
                      child: Chip(
                        padding: EdgeInsets.all(8),
                        elevation: 20,
                        //shadowColor: Colors.black,
                        label: Text(
                          categories[index],
                          style: TextStyle(color: Colors.blue.shade200),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),


            Container(
              child: Obx(
                () => ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: n.nml.length,
                    itemBuilder: (BuildContext context, int i) {
                      return GestureDetector(
                        onTap: () {
                          print(n.nml[i].url.toString());
                          launchUrl(Uri.parse(n.nml[i].url));
                        },
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                child: n.nml[i].urlToImage != null
                                    ? Image.network(
                                        n.nml[i].urlToImage.toString())
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
                                  n.nml[i].title,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                child: Text(
                                  n.nml[i].publishedAt,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                            divide(),
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget divide() {
    return Divider(
      color: Colors.grey.shade400,
    );
  }
}
