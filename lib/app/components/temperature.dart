import 'package:flutter/material.dart';

class Temperature extends StatelessWidget {
  final int value;

  const Temperature({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Temperature $value °C", style: TextStyle(color: Colors.red)),);
  }
}
