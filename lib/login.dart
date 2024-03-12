import 'package:flutter/material.dart';
import 'package:sies_gst_notes/FEsem1new.dart';
// import 'package:sies_gst_notes/dashboard.dart';
import 'package:sies_gst_notes/dashboard1.dart';
import 'package:sies_gst_notes/introduction.dart';
import 'package:sies_gst_notes/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email == "" || password == "") {
      log("Please fill all the fields!");
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        if (userCredential.user != null) {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Dashboard1()));
        }
      } on FirebaseAuthException catch (ex) {
        log(ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF222224),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/loginnew.png'),
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 250),
                    Text(
                      'Login Here', // New text added here
                      style: TextStyle(
                        color: Color(0xFFc79756),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: emailController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.email_outlined),
                        suffixIconColor: Colors.white,
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.password_outlined),
                        suffixIconColor: Colors.white,
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      child: const Text(
                        'Sign in',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        login();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFeccb50),
                        fixedSize: Size(350.0, 50.0),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'OR',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      child: const Text(
                        'Create a new account',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MyRegister(),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFeccb70),
                        fixedSize: Size(300.0, 50.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
