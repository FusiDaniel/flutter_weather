import 'package:flutter/material.dart';
import 'package:weather_report/app/components/place_card.dart';

class PlaceCardRow extends StatelessWidget {
  final qtd;
  const PlaceCardRow({super.key, this.qtd});


  @override
  Widget build(BuildContext context) {
    List<IconData> iconsData = [Icons.sunny, Icons.snowing, Icons.thunderstorm, Icons.cloud, Icons.sunny_snowing];
    return Row(
      children: List.generate(
          qtd,
          (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: PlaceCard(iconData: iconsData[index],),
              )),
    );
  }
}
