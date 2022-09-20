import 'package:flutter/material.dart';

class Humidity extends StatelessWidget {
  final int value;
  const Humidity({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Humidity $value %", style: TextStyle(color: Colors.red),),
    );
  }
}
