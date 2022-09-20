import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_report/app/components/place_card.dart';
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
                      height: 30,
                      width: 30,
                      color: Colors.black,
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
                        height: 30,
                        width: 30,
                        color: Colors.black,
                      ))),
        ],
        elevation: 0,
        centerTitle: true,
        title: Text(
          "WeatherApp",
          style: GoogleFonts.abel(color: Colors.black, fontSize: 25),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      5,
                      (index) => const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: PlaceCard(),
                          )),
                ),
              ),
            )),
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
