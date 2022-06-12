// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skygate/pages/photo_details.dart';

class FavPhotos extends StatefulWidget {
  const FavPhotos({Key? key}) : super(key: key);

  @override
  State<FavPhotos> createState() => _FavPhotosState();
}

class _FavPhotosState extends State<FavPhotos> {
  final List _fav = [];
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    getFav();
  }

  Future<void> getFav() async {
    final SharedPreferences prefs = await _prefs;
    final keys = prefs.getKeys();
    for (String key in keys) {
      final prefsMap = <String, dynamic>{};
      prefsMap[key] = jsonDecode(prefs.getString(key) ?? '0');
      prefsMap.entries.map((e) => _fav.add(e.value)).toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Your favourite photos',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ListView.builder(
                itemCount: _fav == null ? 0 : _fav.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Card(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PhotoDetails(
                                        width: _fav[index]['width'],
                                        height: _fav[index]['height'],
                                        author: _fav[index]['user']['name'],
                                        photo: _fav[index]['urls']['thumb'],
                                        index: _fav[index],
                                        id: _fav[index]['id'],
                                      )));
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                _fav[index]['urls']['small'],
                                width: MediaQuery.of(context).size.width,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
