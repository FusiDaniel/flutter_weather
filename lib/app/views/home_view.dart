import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_report/app/components/place_card.dart';
import 'package:weather_report/app/components/place_card_row.dart';
import 'package:weather_report/app/network/network_service.dart';
import 'package:weather_report/app/style/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final TextEditingController _cityTextController = TextEditingController(text: 'London');
  // final NewtorkService _newtorkService = NewtorkService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      endDrawer: Drawer(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Builder(
            builder: (context) => // Ensure Scaffold is in context
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        padding: EdgeInsets.all(0)),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    child: Image.network(
                      "https://cdn-icons-png.flaticon.com/512/5259/5259008.png",
                      height: 25,
                      width: 25,
                      color: AppColors.primaryText,
                    ))),
        actions: [
          Builder(
              builder: (context) => // Ensure Scaffold is in context
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          padding: EdgeInsets.all(0)),
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                      child: Image.network(
                        "https://cdn-icons-png.flaticon.com/512/3314/3314005.png",
                        height: 25,
                        width: 25,
                        color: AppColors.primaryText,
                      ))),
        ],
        elevation: 0,
        centerTitle: true,
        title: Text(
          "WeatherApp",
          style: GoogleFonts.abel(color: AppColors.primaryText, fontSize: 25),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Stack(alignment: Alignment.center, children: [
          ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.85), BlendMode.dstATop),
              child: Image.asset(
                "assets/background.jpg",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: PlaceCardRow(
                      qtd: 5,
                    ),
                  )),
            ],
          ),
        ]),
      ),
    );
  }

  // void _search() async {
  //   final weatherResponse = await _newtorkService.getWeather(_cityTextController.text);
  //   print(weatherResponse.cityName);
  //   print(weatherResponse.tempsInfo[0].temperature);
  //   print(weatherResponse.tempsInfo[1].temperature);
  //   print(weatherResponse.tempsInfo[2].temperature);
  //   print(weatherResponse.tempsInfo[3].temperature);
  //   print(weatherResponse.tempsInfo[4].temperature);
  // }
}
