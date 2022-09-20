import 'package:flutter/material.dart';
import 'package:weather_report/app/style/style.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: AppColors.card,
        ));
  }
}
