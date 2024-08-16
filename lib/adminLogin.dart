import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/adminhomeScreen.dart';


class AdminLoginScreen extends StatelessWidget {
  final TextEditingController _adminController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.grey,
      
        title:  Text('Admin Login',style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 82, 82, 82),
                Color.fromARGB(255, 97, 175, 101)
              ],
            )
          ),
          
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                
                children: [
                 
                  Container(
                    height: 200,
                    width: 200,
                    child: Lottie.asset(
                      
                      'animations/1.json',),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 90,right:90),
                    child: TextField(
                      controller: _adminController,
                      decoration: const InputDecoration(labelText: 'Admin Username', labelStyle: TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
                                  // Suggested code may be subject to a license. Learn more: ~LicenseLog:2385886258.
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 145, 145, 145)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                                  
                    ),
                    ),
                  ),
                  SizedBox(height: 12,),
                  ElevatedButton(
                    style:ElevatedButton.styleFrom(
                     backgroundColor: Color.fromARGB(255, 0, 104, 165)
                     
                    ),
                    onPressed: () {
                      
                      // Assuming simple login for demo purposes
                      if (_adminController.text == 'admin') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AdminHomeScreen()),
                        );
                      }
                    },
                    child: Text('Login',style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ),
          ),
        ),
      
    );
  }
}
