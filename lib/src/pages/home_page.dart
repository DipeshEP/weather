import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/constants/colors.dart';
import 'package:weather/src/logic/currentlocationcubit/current_location_cubit.dart';
import 'package:weather/src/model/current_temp_model.dart';
import 'package:weather/src/pages/astronomy.dart';
import 'package:weather/src/pages/current_weather.dart';
import 'package:weather/src/pages/location_details.dart';
import 'package:weather/src/pages/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ///widget for first tile, it showing details of current temperature
  Widget currentTemperatureDetails(Current current){
    return Container(
      decoration: BoxDecoration(
          color:Colours.blue.withOpacity(.3),
          borderRadius: const BorderRadius.all(Radius.circular(20))
      ),
      height: MediaQuery.of(context).size.height * .15,
      width: MediaQuery.of(context).size.width * .9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0,top: 15),
            child: Text(
              "Wind Direction   :              ${current.windDir}"  ,
              style: const TextStyle(
                  color: Color(0XFF0F4A6F),
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
                "Humidity             :              ${current.humidity}",
                style: const TextStyle(
                    color: Color(0XFF0F4A6F),
                    fontWeight: FontWeight.w500,
                    fontSize: 15)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text("Temp C               :              ${current.tempC}°C",
                style: const TextStyle(
                    color: Color(0XFF0F4A6F),
                    fontWeight: FontWeight.w500,
                    fontSize: 15)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text("Temp F               :              ${current.tempF}°F",
                style: const TextStyle(
                    color: Color(0XFF0F4A6F),
                    fontWeight: FontWeight.w500,
                    fontSize: 15)),
          )
        ],
      ),
    );
  }

  ///widget for second tile
  Widget moreDetails(Current current, Location location){
    return Container(
      height: MediaQuery.of(context).size.height*.16,
      decoration: BoxDecoration(
        color:const Color(0XFF0F4A6F).withOpacity(.3),
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Padding(
                padding: const EdgeInsets.only(right: 125.0),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CurrentLocation(location: location,)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Column(
                      children:const [
                         Icon(Icons.location_on,
                        color: Color(0XFF0F4A6F)),
                        Text("Location",style:  TextStyle(
                            color: Color(0XFF0F4A6F),
                            fontWeight: FontWeight.w500,
                            fontSize: 15), )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CurrentWeather(current: current,)));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Column(
                    children:const [
                      Icon(Icons.sunny_snowing,
                        color: Color(0XFF0F4A6F),
                      ),
                      Text("Weather", style:  TextStyle(
                          color: Color(0XFF0F4A6F),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),)
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height*.03,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 125.0),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Astronomy()));
                  },
                  child: Column(
                    children:const [
                      Icon(Icons.star_outlined,
                          color: Color(0XFF0F4A6F)),
                      Text("Astronomy",style:  TextStyle(
                          color: Color(0XFF0F4A6F),
                          fontWeight: FontWeight.w500,
                          fontSize: 15))
                    ],
                  ),
                ),
              ),
              Column(
                children:const [
                  Icon(Icons.more_horiz,color: Color(0XFF0F4A6F)),
                  Text("More",style:  TextStyle(
                      color: Color(0XFF0F4A6F),
                      fontWeight: FontWeight.w500,
                      fontSize: 15))
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:const Color(0XFFC3CEDA),
        body: BlocBuilder<CurrentLocationCubit, CurrentLocationState>(
          builder: (context, state) {
            if (state is CurrentLocationLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CurrentLocationLoaded) {
              final current = state.CurrentTemperatures;
              final location = state.location;
              return Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .6,
                    decoration: const BoxDecoration(
                        color: Colours.blue,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .03,
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Search(current: current,location: location,)));
                          },
                          child: Padding(
                            padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*.87),
                            child:const Icon(Icons.search,
                            color:Colours.backgroundWhite ,),
                          ),
                        ),
                        Center(
                          child: Text(
                            location.name,
                            style: const TextStyle(
                                color: Colours.backgroundWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 32),
                          ),
                        ),
                        Center(
                          child: Text(
                           " ${location.region}/ ${location.country}",
                            style: const TextStyle(
                                color: Colours.backgroundWhite,
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .04,
                        ),
                        Center(
                          child: SizedBox(
                              height: MediaQuery.of(context).size.height * .2,
                              child: Image.asset("assets/images/cloudy.png")),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .03,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text(
                            "${current.cloud}°C",
                            style: const TextStyle(
                                color: Colours.backgroundWhite,
                                fontWeight: FontWeight.w700,
                                fontSize: 80),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Text(
                            current.lastUpdated,
                            style: const TextStyle(
                                color: Colours.backgroundWhite,
                                fontWeight: FontWeight.w700,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),

                currentTemperatureDetails(current),
                 
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,top: 10,right: 20),
                  child: moreDetails(current,location),
                )
                ],
              );
            } else if (state is CurrentLocationError) {
              return const Center(
                child: Icon(Icons.error),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
