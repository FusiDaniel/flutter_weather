import 'package:flutter/material.dart';

class Rain extends StatelessWidget {
  final int value;

  const Rain({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Rain $value %", style: TextStyle(color: Colors.red)),);
  }
}