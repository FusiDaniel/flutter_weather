import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather_report/app/style/style.dart';

class PlaceCard extends StatelessWidget {
  final IconData iconData;

  const PlaceCard({super.key, required this.iconData});
  @override
  Widget build(BuildContext context) {
    int randomInt = Random().nextInt(101);
    return Container(
      height: 150,
      width: 65,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: AppColors.card,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(iconData),
          Stack(
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(
                  value: randomInt / 100,
                  strokeWidth: 6,
                  backgroundColor: AppColors.secondaryProgress,
                  color: AppColors.primaryProgress,
                ),
              ),
            SizedBox(
              width: 40,
              height: 40,
              child: Center(child: Text('$randomInt%')),
            )
            ],
          )
        ],
      ),
    );
  }
}
