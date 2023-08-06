import 'package:flutter/material.dart';
import 'package:weather/src/constants/colors.dart';
import 'package:weather/src/model/current_temp_model.dart';

class CurrentLocation extends StatefulWidget {
  final Location location;
  const CurrentLocation({super.key, required this.location});

  @override
  State<CurrentLocation> createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colours.backgroundWhite,
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height*.85,
            width: MediaQuery.of(context).size.width*.8,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color:Colours.blue.withOpacity(.3),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(widget.location.name,
                        style: const TextStyle(
                            color: Colours.blue,
                            fontWeight: FontWeight.w700,
                            fontSize: 20)),
                   const Text("Location",
                        style:  TextStyle(
                            color: Colours.blue,
                            fontWeight: FontWeight.w700,
                            fontSize: 15)),
                  ],
                ),
                Column(
                  children: [
                    Text(widget.location.region,
                        style:const TextStyle(
                            color: Colours.blue,
                            fontWeight: FontWeight.w700,
                            fontSize: 20)),
                   const Text("Region",
                        style:  TextStyle(
                            color: Colours.blue,
                            fontWeight: FontWeight.w700,
                            fontSize: 15)),
                  ],
                ),
                Column(
                  children: [
                    Text(widget.location.country,style: const TextStyle(
                        color: Colours.blue,
                        fontWeight: FontWeight.w700,
                        fontSize: 20)),
                   const Text("Country",
                        style:  TextStyle(
                            color: Colours.blue,
                            fontWeight: FontWeight.w700,
                            fontSize: 15)),
                  ],
                ),
                Column(
                  children: [
                    Text(widget.location.localtime,style: const TextStyle(
                        color: Colours.blue,
                        fontWeight: FontWeight.w700,
                        fontSize: 20)),
                 const   Text("Local Time",
                        style:  TextStyle(
                            color: Colours.blue,
                            fontWeight: FontWeight.w700,
                            fontSize: 15)),
                  ],
                ),
                Column(
                  children: [
                    Text(widget.location.tzId,style:const TextStyle(
                        color: Colours.blue,
                        fontWeight: FontWeight.w700,
                        fontSize: 20)),
                  const  Text("Region",
                        style:  TextStyle(
                            color: Colours.blue,
                            fontWeight: FontWeight.w700,
                            fontSize: 15)),
                  ],
                ),
                Column(
                  children: [
                    Text("${widget.location.lat}",style:const TextStyle(
                        color: Colours.blue,
                        fontWeight: FontWeight.w700,
                        fontSize: 20)),
                  const  Text("Latitude",
                        style:  TextStyle(
                            color: Colours.blue,
                            fontWeight: FontWeight.w700,
                            fontSize: 15)),
                  ],
                ),
                Column(
                  children: [
                    Text("${widget.location.lon}",style:const TextStyle(
                        color: Colours.blue,
                        fontWeight: FontWeight.w700,
                        fontSize: 20)),
                 const   Text("Longitude",
                        style:  TextStyle(
                            color: Colours.blue,
                            fontWeight: FontWeight.w700,
                            fontSize: 15)),
                  ],
                ),
                Column(
                  children: [
                    Text("${widget.location.localtimeEpoch}",style: const TextStyle(
                        color: Colours.blue,
                        fontWeight: FontWeight.w700,
                        fontSize: 20)),
                 const   Text("Local Time Epoch",
                        style:  TextStyle(
                            color: Colours.blue,
                            fontWeight: FontWeight.w700,
                            fontSize: 15)),
                  ],
                ),




              ],
            ),
          ),
        )

      ),
    );
  }
}
