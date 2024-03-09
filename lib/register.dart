import 'package:flutter/material.dart';
import 'package:sies_gst_notes/dashboard.dart';
import 'package:sies_gst_notes/login.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //       image: AssetImage('assets/theme3.jpg'), fit: BoxFit.cover),
      // ),
      // margin: EdgeInsets.only(top: 0),
      child: Scaffold(
      
        backgroundColor: Color(0xFF222224),
        
        body: Stack(
          children: [
            Container(
              margin: 
                  EdgeInsets.only(top: 0,  bottom: 0, right: 0),
              height: 200,
              width: 400,
            decoration: BoxDecoration(
              color: Color(0xFFe1d5c9),
              
              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(80), bottomRight:Radius.circular(80),),
            ),
              padding: EdgeInsets.only(left:50, top:90),
              child: Text(
                '    Create  Account',
                style: TextStyle(color:Color(0xFF222224), fontSize: 50,   fontFamily: 'Teko',),
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
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Name",
                                hintStyle: TextStyle(color: Colors.black),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.black
                            ),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.black),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.black),
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.black),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text(
                          //       'Sign Up',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontSize: 27,
                          //           fontWeight: FontWeight.w700),
                          //     ),
                          //     CircleAvatar(
                          //       radius: 30,
                          //       backgroundColor: Color(0xff4c505b),
                          //       child: IconButton(
                          //           color: Colors.white,
                          //           onPressed: () {},
                          //           icon: Icon(
                          //             Icons.arrow_forward,
                          //           )),
                          //     )
                          //   ],
                          // ),
                          SizedBox(
                            height: 10,
                          ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.pushNamed(context, 'login');
//                                 },
//                                 child: Text(
//                                   'Sign In',
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                       decoration: TextDecoration.underline,
//                                       color: Colors.white,
//                                       fontSize: 18),
//                                 ),
//                                 style: ButtonStyle(),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
                          Column(

                              children:[
                                ElevatedButton(
                                  child: const Text('Sign up',style: TextStyle(color: Colors.black),),
                                  onPressed: ()  => Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (context) => const MyLogin())),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFeccb50),
                                    fixedSize: Size(350.0, 50.0), // Set the desired width and height
                                  ),

                                ),
                                SizedBox(
                                  height: 20,
                                ),



                                Text ('OR',style: TextStyle(color: Colors.white),),
                                SizedBox(
                                  height: 20,
                                ),


                                ElevatedButton(
                                  child: const Text('Sign in',style: TextStyle(color: Colors.black),),
                                  onPressed: ()  => Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (context) => const MyLogin())),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFeccb69),
                                    fixedSize: Size(300.0, 50.0), // Set the desired width and height
                                  ),

                                ),

                              ]
                          )








                        ],  )

                    ),
                    //   ),
                  ],  ),

              ),
            ),
            //),

          ]
        )
      )
    );







  }
}