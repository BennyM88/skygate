// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:skygate/pages/all_photos.dart';
import 'package:skygate/pages/cv.dart';
import 'package:skygate/pages/fav_photos.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;

  void navigate(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  final List<Widget> pages = [
    CV(),
    AllPhotos(),
    FavPhotos(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'sky gate',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: pages[_selectedPage],
      bottomNavigationBar: CurvedNavigationBar(
          color: Color(0xFF181818),
          backgroundColor: Colors.transparent,
          animationDuration: Duration(milliseconds: 450),
          onTap: navigate,
          items: [
            Icon(Icons.home),
            Icon(Icons.photo),
            Icon(Icons.favorite),
          ]),
    );
  }
}
