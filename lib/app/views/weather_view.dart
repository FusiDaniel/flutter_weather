import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_report/app/components/humidity.dart';
import 'package:weather_report/app/components/rain.dart';
import 'package:weather_report/app/components/temperature.dart';
import 'package:weather_report/app/components/wind.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  int currentIndex = 0;

  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    String weekdays = "DSTQQSS";
    List<int> temps = [0, 1, 2, 3, 4, 5, 6];
    List<int> humidities = [0, 1, 2, 3, 4, 5, 6];
    List<int> rains = [0, 1, 2, 3, 4, 5, 6];
    List<int> winds = [0, 1, 2, 3, 4, 5, 6];

    List<Color> colors = [
      Colors.black,
      Colors.blue,
      Colors.red,
      Colors.purple,
      Colors.green,
      Colors.orange,
      Colors.brown
    ];

    return DefaultTabController(
      initialIndex: 0,
      length: 7,
      animationDuration: const Duration(milliseconds: 600),
      child: Scaffold(
        drawer: Drawer(),
        // extendBodyBehindAppBar: true,
        backgroundColor: Color.fromARGB(50, 0, 0, 0),
        appBar: AppBar(
          titleTextStyle: TextStyle(overflow: TextOverflow.visible),
          title: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              "Vila Maria, SP",
              style:
                  GoogleFonts.dosis(fontWeight: FontWeight.w300, fontSize: 27),
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(0, 0, 0, 0),
          elevation: 0,
          bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: List.generate(
                  7,
                  (index) => Tab(
                        // iconMargin: const EdgeInsets.only(bottom: 10.0),
                        text: weekdays[index],
                      ))),
        ),
        body: Stack(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                // color: Colors.purple,
                image: DecorationImage(
                    image: AssetImage(
                      "assets/weather/Base.png",
                    ),
                    fit: BoxFit.cover)),
          ),
          TabBarView(
              children: List.generate(7, (index) {
            String image;
            if (index % 2 == 0) {
              image = "assets/weather/Day.png";
            } else {
              image = "assets/weather/Night.png";
            }
            return Stack(children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      // color: Colors.purple,
                      image: DecorationImage(
                          image: AssetImage(
                            image,
                          ),
                          fit: BoxFit.cover))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Temperature(value: temps[index]),
                    Rain(value: rains[index]),
                    Humidity(value: humidities[index]),
                    Wind(value: winds[index]),
                  ],
                ),
              )
            ]);
          })),
        ]),
      ),
    );
  }
}

Widget myContainer(Color color) {
  return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      // color: Colors.red,

      child: Padding(
        padding: const EdgeInsets.only(top: 230, left: 7),
        child: SizedBox(
          width: 50,
          height: 50,
          child: Column(children: [
            Container(
              width: 25,
              height: 12.5,
              color: color,
            ),
            Container(
              width: 100,
              height: 12.5,
              color: color,
            )
          ]),
        ),
      ));
}
