import 'package:flutter/material.dart';
import 'package:sies_gst_notes/dashboard.dart';
import 'package:sies_gst_notes/dashboard1.dart';
import 'package:sies_gst_notes/introduction.dart';
import 'package:sies_gst_notes/register.dart';

// import 'package:sies_gst_notes/dashboard1.dart'

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login(BuildContext context) {
    // Replace this with your authentication logic
    String email = _emailController.text;
    String password = _passwordController.text;

    // Example: Hardcoded credentials for demonstration purposes
    String correctEmail = '';
    String correctPassword = '';

    if (email == correctEmail && password == correctPassword) {
      // Navigate to dashboard if credentials are correct
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Dashboard1()),
      );
    } else {
      // Show error message if credentials are incorrect
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Incorrect email or password. Please try again.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color(0xFF222224),
      body: Stack(
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
         SizedBox(height: 100),
          Scaffold(
         

            backgroundColor: Color.fromARGB(0, 0, 0, 0),
            
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Text(
                  //   'Login ',
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 70,
                  //     fontWeight: FontWeight.w900,
                  //     decoration: TextDecoration.none,
                  //     fontFamily: 'Teko',
                  //   ),
                  //   textAlign: TextAlign.center,
                  // ),
                 SizedBox(height: 250),
                  Text(
      'Login Here', // New text added here
      style: TextStyle(
        color:  Color(0xFFc79756),
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _emailController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 20),
                  
                  TextField(
                    controller: _passwordController,
                    style: TextStyle(),
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    child: const Text(
                      'Sign in',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () => _login(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFeccb50),
                      fixedSize: Size(350.0, 50.0),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'OR',
                    style: TextStyle(color: Colors.white,),
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
          ),
        ],
      ),
    );
  }
}
