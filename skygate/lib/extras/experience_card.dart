// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard(
      {Key? key,
      required this.companyName,
      required this.worksite,
      required this.toDo})
      : super(key: key);

  final String companyName;
  final String worksite;
  final String toDo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 220,
          padding: EdgeInsets.all(10),
          color: Colors.grey.shade800,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                companyName,
                style: TextStyle(
                    color: Color(0xFFe5bce7),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                worksite,
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
              Text(
                toDo,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
