import 'package:flutter/material.dart';
import 'package:get/get.dart';


class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  List<String> categories = ["World","Business","Tech","Science","HealthCare","Sports","Accounting",
    "Advertising & Marketing", "Banking & Finance","Art & Culture", "Books & Literature","Fitness & Wellbeing","Adventure & Outdoors",];
  
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
