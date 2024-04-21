import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/pages/homepage.dart';

void main() async {
  //init hive
  await Hive.initFlutter();

  //create box
  var box = await Hive.openBox('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.yellow),
        primaryColor: Colors.yellow,
        textTheme: GoogleFonts.interTextTheme(),
      ),
    );
  }
}
