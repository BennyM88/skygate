// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skygate/pages/photo_details.dart';

class AllPhotos extends StatefulWidget {
  const AllPhotos({Key? key}) : super(key: key);

  @override
  State<AllPhotos> createState() => _AllPhotosState();
}

class _AllPhotosState extends State<AllPhotos> {
  List _data = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<String> getData() async {
    var response = await http.get(Uri.parse(
        'https://api.unsplash.com/photos?per_page=30&client_id=zUEgCnKvj8kN9nfNfXmbhY1q35kSNVMAYcXA6_kldms'));
    var converted = jsonDecode(response.body);
    setState(() {
      _data = converted;
    });
    return 'success';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Discover new photos',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ListView.builder(
                itemCount: _data == null ? 0 : _data.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Card(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PhotoDetails(
                                        width: _data[index]['width'],
                                        height: _data[index]['height'],
                                        author: _data[index]['user']['name'],
                                        photo: _data[index]['urls']['thumb'],
                                        index: _data[index],
                                        id: _data[index]['id'],
                                      )));
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                _data[index]['urls']['small'],
                                width: MediaQuery.of(context).size.width,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ))
        ],
      ),
    );
  }
}
