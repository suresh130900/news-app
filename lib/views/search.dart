import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/services/category_news.dart';
import 'package:news_app/views/categories_data.dart';


class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  category_news cat_news = Get.put(category_news());

  List<String> categories = ["world","business","tech","Science","HealthCare","Sports","Accounting",
    "Marketing", "Banking","Art & Culture", "Books","Literature","Fitness","Outdoors",];
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
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
            children: <Widget> [
                Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("Search",
                style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold
                ),
            ),
          ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                      child: TextField(
                        cursorColor: Colors.grey,
                        cursorHeight: 25,
                        decoration: InputDecoration(
                          fillColor: Colors.black,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none
                          ),
                          hintText: 'Search',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20
                            ),
                          prefixIcon: Container(
                            padding: EdgeInsets.all(15),
                            width: 10,
                            child: Icon(
                              Icons.search_rounded,
                              color: Colors.grey,
                              size: 28,
                            ),
                          )
                        ),
                      ),
                  ),
                ],
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: (BuildContext context , int index){
                  return ListTile(
                    onTap: (){
                      print(categories[index]);
                      cat_news.get_news(categories[index]);
                      Get.to(categories_data());
                    },
                    title: Text(
                      categories[index],
                    ),
                    trailing: Icon(
                      Icons.navigate_next,
                    ),
                  );
              },
              ),
        ],
       ),
      ),
    );
  }
}
