import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';


import 'package:myapp/notes_model.dart';
import 'package:myapp/splash_Screen.dart';
import 'package:myapp/user_model.dart';
import 'package:myapp/userprovider.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<UserModel>('users');
  await Hive.openBox<NotesModel>('notes');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'User Management',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
        
      )
      
    );
  }
}
