import 'dart:convert';
//import 'dart:ffi';

import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}


class MyThemeApp{

  static ThemeData appThemeDark(){
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        iconTheme: IconThemeData(
        color: Colors.white,
      ),
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    );
  }
}
class _homeState extends State<home> with SingleTickerProviderStateMixin {

  //Json data
  var data = [
    {
      "title" : "MCX Crude oil may find support at Rs 6,400; Natural Gas could test Rs 227",
      "subtitle" : "By David Gaffen",
      "img" : "https://thumbs.dreamstime.com/b/environmentally-friendly-renewable-energy-12153665.jpg"
    },
      {
      "title" : "At least 68 killed in Nepal's worst airplane crash in 30 years",
        "subtitle" : "By CNN",
      "img" : "https://thumbs.dreamstime.com/b/environmentally-friendly-renewable-energy-12153665.jpg"
    },
    {
      "title" : "COVID-19: Maharashtra logs 12 new cases, one death; active tally 94",
      "subtitle" : "By ThePrint",
      "img" : "https://thumbs.dreamstime.com/b/environmentally-friendly-renewable-energy-12153665.jpg"
    },
    {
      "title" : "Actor Rege-Jean Page Is The Most Handsome Man In The World, According To Science",
      "subtitle" : "By NDTV",
      "img" : "https://thumbs.dreamstime.com/b/environmentally-friendly-renewable-energy-12153665.jpg"
    },
    {
      "title" : "Budget 2023 provisions must be in line with India's low emission development strategies: TERI DG",
      "subtitle" : "By Economics Times",
      "img" : "https://thumbs.dreamstime.com/b/environmentally-friendly-renewable-energy-12153665.jpg"
    },
    {
      "title" : "India gets its first intranasal vaccine for COVID for Rs 800 per dose",
      "subtitle" : "By Bussiness Today",
      "img" : "https://images.cnbctv18.com/wp-content/uploads/2022/12/Delhi-covid-19-mock-drill-preparedness-coronavirus-cases-rise-1019x573.jpg"
    },{
      "title" : "Budget 2023 provisions must be in line with India's low emission development strategies: TERI DG",
      "subtitle" : "By Economics Times",
      "img" : "https://thumbs.dreamstime.com/b/environmentally-friendly-renewable-energy-12153665.jpg"
    },
    {
      "title" : "India gets its first intranasal vaccine for COVID for Rs 800 per dose",
      "subtitle" : "By Bussiness Today",
      "img" : "https://images.cnbctv18.com/wp-content/uploads/2022/12/Delhi-covid-19-mock-drill-preparedness-coronavirus-cases-rise-1019x573.jpg"
    },
    {
      "title" : "Budget 2023 provisions must be in line with India's low emission development strategies: TERI DG",
      "subtitle" : "By Economics Times",
      "img" : "https://thumbs.dreamstime.com/b/environmentally-friendly-renewable-energy-12153665.jpg"
    },
    {
      "title" : "India gets its first intranasal vaccine for COVID for Rs 800 per dose",
      "subtitle" : "By Bussiness Today",
      "img" : "https://images.cnbctv18.com/wp-content/uploads/2022/12/Delhi-covid-19-mock-drill-preparedness-coronavirus-cases-rise-1019x573.jpg"
    },


  ];

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

      bottomNavigationBar: BottomNavigationBar(
        //this will change the colour and style of the
        currentIndex: index,onTap: (i){
          setState(() {
            index = i;
          });
      },
        //declaring a array of items
        items: [
          //auto suggested
          BottomNavigationBarItem(
            //background color of the navigation bar
            //backgroundColor: Colors.purple.shade400,
            //selecting an active icon and giving it color
            activeIcon: Icon(Icons.home,
            color: Colors.amberAccent.shade100,
              size: 30,
            ),
              //displaying icon
              icon: Icon(
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
            icon: Icon(
              Icons.search_outlined,
              color: Colors.white,
              size: 30,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.purple.shade200,
            activeIcon: Icon(
              Icons.bookmark,
              color: Colors.amberAccent.shade100,
              size: 30,
            ),
            icon: Icon(
              Icons.bookmark_added_outlined,
              color: Colors.white,
              size: 30,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.purple.shade100,
            activeIcon: Icon(
              Icons.settings,
              color: Colors.amberAccent.shade100,
              size: 30,
            ),
            icon: Icon(
              Icons.settings_outlined,
              color: Colors.white,
              size: 30,
            ),
            label: "",
          ),
        ],
      ),
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.menu,
        //color: Colors.black,
        ),
        title: Text("Latest News"),
        actions: <Widget>[
          IconButton(onPressed: () {},
            icon: Icon(
              Icons.square,
              //color: Colors.grey,
            ),
          ),
          IconButton(onPressed: () {} ,
              icon: Icon(
                Icons.grid_view_rounded,
                //color: Colors.grey,
              ),
          ),
          IconButton(onPressed: () {},
              icon: Icon(
                Icons.list,
                //color: Colors.black,
              ),
          ),

        ],
        //backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text("Bussiness",
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),
            Divider(
            color: Colors.white,
            ),
            Container(

              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (BuildContext context , int i){
                return ListTile(
                  leading: SizedBox(height:200,child: Image.network(data[i]["img"].toString(),height: 200,
                    width: 100,
                    fit: BoxFit.cover,)),
                  title: Text(data[i]["title"].toString(),
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                  subtitle: Text(data[i]["subtitle"].toString(),
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.white),
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
