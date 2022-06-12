// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Progress extends StatelessWidget {
  const Progress({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18),
          ),
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 250,
            lineHeight: 10,
            animation: true,
            percent: value,
            progressColor: Color(0xFFe5bce7),
            backgroundColor: Colors.grey.shade800,
            barRadius: Radius.circular(5),
          ),
        ],
      ),
    );
  }
}
