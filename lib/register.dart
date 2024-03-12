import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sies_gst_notes/dashboard.dart';
import 'package:sies_gst_notes/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void createAccount() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      // Show an error message if any field is empty
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text("Please fill all the details!"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK"),
            ),
          ],
        ),
      );
      return; // Exit the method if any field is empty
    }

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // User created successfully
      print("User created successfully: ${userCredential.user?.email}");

      // Navigate back if user created successfully
      if (userCredential.user != null) {
        Navigator.pop(context);
      }
    } catch (e, stackTrace) {
      // An error occurred during account creation
      print("Error creating user: $e");
      print("StackTrace: $stackTrace");
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Color(0xFFe1d5c9),
          title: Text("Error"),
          content: Text(
              "An error occurred while creating the account. Please try again later."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color(0xFF222224),
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 0, bottom: 0, right: 0),
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                color: Color(0xFFe1d5c9),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  bottomRight: Radius.circular(80),
                ),
              ),
              padding: EdgeInsets.only(left: 50, top: 90),
              child: Text(
                '    Create  Account',
                style: TextStyle(
                    color: Color(0xFF222224), fontSize: 50, fontFamily: 'Teko'),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            controller: nameController,
                            style: TextStyle(color: Colors.white),
                            // obscureText: true,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.people_outline),
                              suffixIconColor: Colors.white,
                              hintText: "Name",
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: emailController,
                            style: TextStyle(color: Colors.white),
                            // obscureText: true,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.email_outlined),
                              suffixIconColor: Colors.white,
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: passwordController,
                            style: TextStyle(color: Colors.white),
                            obscureText: true,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.password_outlined),
                              suffixIconColor: Colors.white,
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Column(
                            children: [
                              ElevatedButton(
                                child: const Text('Sign up',
                                    style: TextStyle(color: Colors.black)),
                                onPressed: () {
                                  createAccount();
                                },
                                // Navigator.of(context).push(
                                //     MaterialPageRoute(
                                //         builder: (context) => const MyLogin())),

                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFeccb50),
                                  fixedSize: Size(350.0,
                                      50.0), // Set the desired width and height
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('OR', style: TextStyle(color: Colors.white)),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                child: const Text('Sign in',
                                    style: TextStyle(color: Colors.black)),
                                onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => const MyLogin())),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFeccb69),
                                  fixedSize: Size(300.0,
                                      50.0), // Set the desired width and height
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
