import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/home.dart';
import 'package:news_app/services/signup_service.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  signup_service signup_person = Get.put(signup_service());
  final TextEditingController email_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();

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
                    const SizedBox(
                      height: 30,
                    ),
                     TextField(
                       style: TextStyle(
                         color: Colors.white
                       ),
                      controller: email_controller,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                     TextField(
                       style: TextStyle(color: Colors.white),
                       controller: password_controller,
                      obscureText: true,
                       decoration: InputDecoration(

                         enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(5),
                           borderSide: BorderSide(
                             color: Colors.white,
                             width: 1.0,
                           ),
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(30),
                           borderSide: BorderSide(
                             color: Colors.blue,
                             width: 2.0,
                           ),
                         ),
                         hintText: 'ENTER PASSWORD',

                         hintStyle: TextStyle(color: Colors.white),
                       ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade300,
                          foregroundColor: Colors.black
                      ),
                      onPressed: () {
                        signup_person.signup_user(email_controller.text, password_controller.text);

                        var error = signup_person.error.value;
                        print("printing the error value");
                        print(error);
                        if(error == false)
                          {
                            Get.to(home());
                          }
                        else
                          {
                            Get.snackbar("title", "Something went wrong");
                          }
                      },
                      child: const Text("Signup"),
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}
