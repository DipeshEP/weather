import 'package:flutter/material.dart';
import 'package:weather/src/constants/colors.dart';
import 'package:weather/src/model/current_temp_model.dart';

class CurrentWeather extends StatefulWidget {
  final Current current;
  const CurrentWeather({super.key, required this.current});

  @override
  State<CurrentWeather> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colours.lightBlue,
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
       const Text("Current Weather", style:  TextStyle(
            color: Colours.backgroundWhite,
            fontWeight: FontWeight.w700,
            fontSize: 30),),
       SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    SizedBox(height: 70,
                        width: 70,
                        child: Image.asset("assets/images/cloudy_wB.png")),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text("${widget.current.cloud}", style: const TextStyle(
                          color: Colours.backgroundWhite,
                          fontWeight: FontWeight.w700,
                          fontSize: 30),),
                    ),

                  ],
                ),
                Stack(
                  children: [
                    SizedBox(height: 100,
                        width: 100,
                        child: Image.asset("assets/images/windy.png")),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text("${widget.current.windDir}", style: const TextStyle(
                          color: Colours.backgroundWhite,
                          fontWeight: FontWeight.w700,
                          fontSize: 30),),
                    ),

                  ],
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    SizedBox(height: 100,
                        width: 100,
                        child: Image.asset("assets/images/windy.png")),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text("${widget.current.windKph} kph", style: const TextStyle(
                          color: Colours.backgroundWhite,
                          fontWeight: FontWeight.w700,
                          fontSize: 30),),
                    ),

                  ],
                ),
                Stack(
                  children: [
                    SizedBox(height: 100,
                        width: 100,
                        child: Image.asset("assets/images/windy.png")),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text("${widget.current.windMph} mph", style: const TextStyle(
                          color: Colours.backgroundWhite,
                          fontWeight: FontWeight.w700,
                          fontSize: 30),),
                    ),

                  ],
                ),

              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    SizedBox(height: 70,
                        width: 70,
                        child: Image.asset("assets/images/c.png")),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text("${widget.current.tempC} ", style: const TextStyle(
                          color: Colours.backgroundWhite,
                          fontWeight: FontWeight.w700,
                          fontSize: 30),),
                    ),

                  ],
                ),
                Stack(
                  children: [
                    SizedBox(height: 70,
                        width: 70,
                        child: Image.asset("assets/images/f.png")),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text("${widget.current.tempF} ", style: const TextStyle(
                          color: Colours.backgroundWhite,
                          fontWeight: FontWeight.w700,
                          fontSize: 30),),
                    ),

                  ],
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    SizedBox(height: 90,
                        width: 80,
                        child: Image.asset("assets/images/uv.png")),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text("${widget.current.uv} ", style: const TextStyle(
                          color: Colours.backgroundWhite,
                          fontWeight: FontWeight.w700,
                          fontSize: 30),),
                    ),

                  ],
                ),
                Stack(
                  children: [
                    SizedBox(height: 100,
                        width: 100,
                        child: Image.asset("assets/images/humidity.png")),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text("${widget.current.humidity} ", style: const TextStyle(
                          color: Colours.backgroundWhite,
                          fontWeight: FontWeight.w700,
                          fontSize: 30),),
                    ),

                  ],
                ),

              ],
            ),


          ],
        ) ,
      ),
    );
  }
}
