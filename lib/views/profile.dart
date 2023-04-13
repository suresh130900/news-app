import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/views/login_page.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> with SingleTickerProviderStateMixin {
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("My Profile",
                style: TextStyle
                  (color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  height: 100,
                  width: 400,
                  child: ListView(
                    shrinkWrap: true,
                    //physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      Container(
                        height: 100,
                        //width: 100,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                              "https://png.pngtree.com/png-vector/20220709/ourmid/pngtree-businessman-user-avatar-wearing-suit-with-red-tie-png-image_5809521.png",
                            ),
                          ),
                          title: Text("HELLO SURESH",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          subtitle: Text("Suresh@gmail.com",
                          style: TextStyle(
                              color: Colors.white
                          ),
                          ),
                          trailing: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Text("Edit Profile",
                            style: TextStyle(
                                color: Colors.white
                            ),
                            ),
                            textColor: Colors.amberAccent.shade100,
                            color: Colors.grey,
                            onPressed: (){
                              print("Button is presses");
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  onTap: (){
                    print("Favrourite Button is Pressed");
                  },
                  leading: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                  title: Text("Favourites",
                    style: TextStyle(
                        fontSize: 18,
                      color: Colors.white
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  onTap: (){
                    print("Language Button is Pressed");
                  },
                  leading: Icon(
                      CupertinoIcons.globe,
                    color: Colors.white,
                  ),
                  title: Text("Language",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  onTap: (){
                    print("Location Button is Pressed");
                  },
                  leading: Icon(
                      Icons.pin_drop,
                    color: Colors.white,
                  ),
                  title: Text("Location",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            //Logout Button
            ListTile(
              onTap: (){
                print("Logout Button is Pressed");
                Get.to(login());
              },
              leading: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: Text("Logout",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
