import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/constants/colors.dart';
import 'package:weather/src/logic/astronomy_cubit/astronomy_cubit.dart';

class Astronomy extends StatefulWidget {
  const Astronomy({super.key});

  @override
  State<Astronomy> createState() => _AstronomyState();
}

class _AstronomyState extends State<Astronomy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colours.blue,
        title: const Text("Astronomy"),
        centerTitle: true,
      ),
      backgroundColor: Colours.blue,
      body: BlocBuilder<AstronomyCubit, AstronomyState>(
        builder: (context, state) {
          if (state is AstronomyLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AstronomyLoaded) {
            final astronomyData = state.astronomy;
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*.15,
                      width: MediaQuery.of(context).size.width*.35,
                      decoration: const BoxDecoration(
                        color: Colours.backgroundWhite,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20)
                             )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${astronomyData.astronomy.astro.sunrise}",
                            style: const TextStyle(
                              color: Colours.blue,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),),
                         const  Text("Sunrise",
                              style:  TextStyle(
                              color: Colours.blue,
                              fontWeight: FontWeight.w700,
                              fontSize: 15))
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*.15,
                      width: MediaQuery.of(context).size.width*.35,
                      decoration: const BoxDecoration(
                          color: Colours.backgroundWhite,
                          borderRadius: BorderRadius.all(
                              Radius.circular(20)
                          )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${astronomyData.astronomy.astro.sunset}",
                            style: const TextStyle(
                                color: Colours.blue,
                                fontWeight: FontWeight.w700,
                                fontSize: 15),),
                          const  Text("Sunset",
                              style:  TextStyle(
                                  color: Colours.blue,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15))
                        ],
                      ),

                    ),

                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*.15,
                      width: MediaQuery.of(context).size.width*.35,
                      decoration: const BoxDecoration(
                          color: Colours.backgroundWhite,
                          borderRadius: BorderRadius.all(
                              Radius.circular(20)
                          )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${astronomyData.astronomy.astro.moonrise}",
                            style: const TextStyle(
                                color: Colours.blue,
                                fontWeight: FontWeight.w700,
                                fontSize: 15),),
                          const  Text("Moonrise",
                              style:  TextStyle(
                                  color: Colours.blue,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15))
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*.15,
                      width: MediaQuery.of(context).size.width*.35,
                      decoration: const BoxDecoration(
                          color: Colours.backgroundWhite,
                          borderRadius: BorderRadius.all(
                              Radius.circular(20)
                          )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${astronomyData.astronomy.astro.moonset}",
                            style: const TextStyle(
                                color: Colours.blue,
                                fontWeight: FontWeight.w700,
                                fontSize: 15),),
                          const  Text("Moonset",
                              style:  TextStyle(
                                  color: Colours.blue,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15))
                        ],
                      ),

                    ),

                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*.03,
                ),
               const Divider(
                  color: Colours.backgroundWhite,
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*.03,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20),
                  child: ExpansionTile(

                    collapsedIconColor:Colours.blue ,
                    backgroundColor: Colours.backgroundWhite,
                    collapsedBackgroundColor: Colours.backgroundWhite,
                    title: const Text("Astronomy",
                        style: TextStyle(
                        color: Colours.blue,
                        fontWeight: FontWeight.w700,
                        fontSize: 15)),
                    children: [
                      ListTile(
                        subtitle: Text(astronomyData.astronomy.astro.moonIllumination,
                            style: const TextStyle(
                            color: Colours.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 15)),
                        title:const Text("Moon Illumination",
                            style: TextStyle(
                            color: Colours.blue,
                            fontWeight: FontWeight.w700,
                            fontSize: 15)),
                      ),
                      ListTile(
                        subtitle: Text(astronomyData.astronomy.astro.moonPhase,
                            style: const TextStyle(
                                color: Colours.blue,
                                fontWeight: FontWeight.w500,
                                fontSize: 15)),
                        title:const Text("Moon Phase",
                            style: TextStyle(
                                color: Colours.blue,
                                fontWeight: FontWeight.w700,
                                fontSize: 15)),
                      ),
                      ListTile(
                        subtitle: Text("${astronomyData.astronomy.astro.isMoonUp}",
                            style: const TextStyle(
                                color: Colours.blue,
                                fontWeight: FontWeight.w500,
                                fontSize: 15)),
                        title:const Text("MoonUp",
                            style: TextStyle(
                                color: Colours.blue,
                                fontWeight: FontWeight.w700,
                                fontSize: 15)),
                      )

                    ],
                  ),
                )
                // Text(astronomyData.astronomy.astro),
              ],
            );
          } else if (state is AstronomyError) {
            return const Center(
              child: Icon(Icons.error),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
