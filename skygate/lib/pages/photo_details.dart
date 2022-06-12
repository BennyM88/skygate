// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhotoDetails extends StatefulWidget {
  PhotoDetails({
    Key? key,
    required this.width,
    required this.height,
    required this.author,
    required this.photo,
    required this.index,
    required this.id,
  }) : super(key: key);

  var width;
  var height;
  var author;
  var photo;
  var index;
  var id;

  @override
  State<PhotoDetails> createState() => _PhotoDetailsState();
}

class _PhotoDetailsState extends State<PhotoDetails> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  var added = SnackBar(
      content: Text('Added to favourites'), duration: Duration(seconds: 2));
  var removed = SnackBar(
      content: Text('Removed from favourites'), duration: Duration(seconds: 2));

  Future<void> saveFav() async {
    final SharedPreferences prefs = await _prefs;
    prefs
        .setString(widget.id.toString(), jsonEncode(widget.index))
        .then((value) => ScaffoldMessenger.of(context).showSnackBar(added));
  }

  Future<void> deleteFav() async {
    final SharedPreferences prefs = await _prefs;
    await prefs
        .remove(widget.id.toString())
        .then((value) => ScaffoldMessenger.of(context).showSnackBar(removed));
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    if (isLiked) {
      deleteFav();
    } else {
      saveFav();
    }
    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Width: ', style: TextStyle(fontSize: 22)),
                  Text(widget.width.toString(), style: TextStyle(fontSize: 22)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Height: ', style: TextStyle(fontSize: 22)),
                  Text(widget.height.toString(),
                      style: TextStyle(fontSize: 22)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Author: ', style: TextStyle(fontSize: 22)),
                  Text(widget.author.toString(),
                      style: TextStyle(fontSize: 22)),
                ],
              ),
              Image.network(
                widget.photo,
                width: MediaQuery.of(context).size.width,
              ),
              LikeButton(
                onTap: onLikeButtonTapped,
                size: 80,
                circleColor:
                    CircleColor(start: Colors.white, end: Color(0xFFe5bce7)),
                bubblesColor: BubblesColor(
                    dotPrimaryColor: Color(0xFFe5bce7),
                    dotSecondaryColor: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
