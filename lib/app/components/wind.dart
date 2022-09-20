import 'package:flutter/material.dart';

class Wind extends StatelessWidget {
  final int value;

  const Wind({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Wind $value km/h", style: TextStyle(color: Colors.red)),);
  }
}