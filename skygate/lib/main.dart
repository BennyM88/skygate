// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skygate/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFFe5bce7),
          scaffoldBackgroundColor: Colors.black,
          textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white)),
    );
  }
}
