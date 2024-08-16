import 'package:flutter/material.dart';
import 'package:myapp/adminLogin.dart';
import 'package:myapp/userLogin.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 219, 219, 219),
        title: Row(
          children: [
            Image.asset('images/Tiplogo.png', width: 50, height: 50),
            SizedBox(width: 19),
          
            Center(
              child: Text(
                'Telephone Industries of Pakistan\nsubsidairy of NRTC', style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),),
            ),
            SizedBox(width: 13),
            Image.asset('images/NRTClogo.png', width: 44, height: 50)
          ],
        ),
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
          child: Column(

            children: [
              SizedBox(height: 18,),
              Text('Welcome to CMS Portal',style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 255, 208, 0)),),
              Image.asset('images/employee.jpg', width: 150, height: 150),
              SizedBox(height: 0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 104, 165)
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserLoginScreen()),
                  );
                },
                child: Text('Employee Login',style: TextStyle(color: Colors.white),),
              ),
              SizedBox(height: 20),
              Image.asset(  'images/admin.jpg', width: 150, height: 150),
              SizedBox(height: 10,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 104, 165)
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminLoginScreen()),
                  );
                },
                child: Text('Admin Login',style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
