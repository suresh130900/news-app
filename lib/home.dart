import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/views/home_inner.dart';
import 'package:news_app/views/search.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class MyThemeApp {
  static ThemeData appThemeDark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    );
  }
}

class _homeState extends State<home> with SingleTickerProviderStateMixin {
  //for color swicthing
  int index = 0;

  late AnimationController _controller;

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
      backgroundColor: Colors.black,
      //for the buttons on the bottom
      drawer: Drawer(
        child: ListView(
          children: const <Widget>[
            DrawerHeader(
                child: Text("Menu",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage('https://st.depositphotos.com/1152339/1972/i/600/depositphotos_19723583-stock-photo-news-concept-news-on-digital.jpg'))),
            ),
            ListTile(
              leading: Icon(
                Icons.input,
              ),
              title: Text("Welcome"),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
              ),
              title: Text("Settings"),
            ),
            ListTile(
              leading: Icon(
                Icons.border_color,
              ),
              title: Text("Feedback"),
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
              ),
              title: Text("Logout"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //this will change the colour and style of the
        currentIndex: index,
        onTap: (i) {
          setState(() {
            index = i;
          });
        },
        //declaring a array of items
        items: [
          //auto suggested
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: Colors.amberAccent.shade100,
              size: 30,
            ),
            //displaying icon
            icon: const Icon(
              //this will change of the icon
              Icons.home_outlined,
              color: Colors.white,
              size: 30,
            ),
            label: "",
          ),

          BottomNavigationBarItem(
            //backgroundColor: Colors.purple.shade300,
            activeIcon: Icon(
              Icons.search,
                color: Colors.amberAccent.shade100,
                size: 30,
            ),
            icon: const Icon(
              Icons.search_outlined,
              color: Colors.white,
              size: 30,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.purple.shade100,
            activeIcon: Icon(
              Icons.person_outline_outlined,
              color: Colors.amberAccent.shade100,
              size: 30,
            ),
            icon: const Icon(
              Icons.person,
              color: Colors.white,
              size: 30,
            ),
            label: "",
          ),
        ],
      ),
      appBar: AppBar(
        elevation: 0,
        title: const Text("Latest News"),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_alert_rounded,
              //color: Colors.grey,
            ),
          ),
        ],
        //backgroundColor: Colors.white,
      ),
      body: IndexedStack(
        index: index,
        children: [
          HomeInner(),
          Center(
            child: search(),
          ),
          HomeInner(),
        ],
      ),
    );
  }
}
