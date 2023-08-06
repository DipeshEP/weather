import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/logic/astronomy_cubit/astronomy_cubit.dart';
import 'package:weather/src/logic/currentlocationcubit/current_location_cubit.dart';
import 'package:weather/src/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    ///dependency injection
    return MultiBlocProvider(
      providers: [
        BlocProvider<CurrentLocationCubit>(
          create: (context) => CurrentLocationCubit(),
        ),
        BlocProvider<AstronomyCubit>(
          create: (context) => AstronomyCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
