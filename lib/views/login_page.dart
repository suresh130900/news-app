import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/home.dart';
import 'package:news_app/views/signup_page.dart';
import 'package:news_app/services/login_service.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);


  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  login_service login_per = Get.put(login_service());
  final TextEditingController email_controller = TextEditingController();
  final TextEditingController pass_controller = TextEditingController();


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
          children: [
            Container(
              child: Image.network("https://st.depositphotos.com/1152339/1972/i/600/depositphotos_19723583-stock-photo-news-concept-news-on-digital.jpg"),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: email_controller,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder()
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: pass_controller,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "PassWord",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(signup());
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),

                    Text("Not have an Account?",
                    style: TextStyle(
                        color: Colors.blue.shade200,
                        fontSize: 15
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Signup",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue.shade200,
                      ),
                      ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade300,
                      foregroundColor: Colors.black
                    ),
                      onPressed: () {
                      login_per.verify_login(email_controller.text, pass_controller.text).then((value) {
                        var res = login_per.error.value;

                        if(res == false) {
                          Get.to(home());
                        }
                        else{
                          Get.snackbar("title", "Something went wrong!");
                        }
                      });

                      },
                      child: Text("Login"),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
