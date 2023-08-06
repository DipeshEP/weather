// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'dart:convert';
//
// import 'package:weather/src/constants/colors.dart';
// import 'package:weather/src/logic/Search/search_cubit.dart';
//
// import '../model/search_model.dart';
//
// class Search extends StatefulWidget {
//   const Search({super.key});
//
//   @override
//   _SearchState createState() => _SearchState();
// }
//
// class _SearchState extends State<Search> {
//
//   List<Forecastday> forecastDayList=[];
//   bool isLoading = false;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colours.backgroundWhite,
//         body: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: BlocBuilder<SearchCubit, SearchState>(
//               builder: (context, state) {
//                 if(state is SearchLoading){
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }else if(state is SearchLoaded){
//                   final searchData=state.searchModel;
//                   Current current=searchData.current;
//                   Location location=searchData.location;
//                  Forecast forecast =searchData.forecast;
//                  List<Forecastday> list=forecast.forecastday;
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       _searchBar(),
//                       Expanded(
//                         flex: 1,
//                         child: _mainData(list),
//                       )
//                     ],
//                   );
//                 }else if(state is SearchError){
//                   return const Center(
//                     // child: Text("data"),
//                   );
//                 }else{
//                   return Container();
//                 }
//
//               },
//             )
//         ),
//       ),
//     );
//   }
//
//   Widget _searchBar() {
//     return Container(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: TextField(
//         decoration:  InputDecoration(
//           hintText: "Search Dog Breeds Here...",
//           // prefixIcon: Icon(Icons.search),
//         ),
//         onChanged: (text) {
//           _filterDogList(text);
//         },
//       ),
//     );
//   }
//
//   // tempList.add(breed.toString().toUpperCase());
//
//
//   Widget _mainData(List<Forecastday> forecastDay) {
//     forecastDayList =forecastDay;
//     return Center(
//       child: isLoading ?
//       CircularProgressIndicator() :
//       ListView.builder(
//           itemCount: forecastDay.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//                 // title: Text(forecastDay[index].astro,)
//             );
//           }),
//     );
//   }
//
//   _filterDogList(String text) {
//     if (text.isEmpty) {
//       setState(() {
//         forecastDayList;
//         // dogsBreedList = tempList;
//       });
//     }
//     else {
//       final List<String> filteredBreeds = [];
//       // forecastDayList.map((breed) {
//       //   if (breed.(text.toString().toUpperCase())) {
//       //     filteredBreeds.add(breed);
//       //   }
//       // }).toList();
//       setState(() {
//         forecastDayList = [];
//       });
//     }
//   }
// // Dio dio=Dio();
// //   _fetchDogsBreed() async{
// //     setState(() {
// //       isLoading = true;
// //     });
// //     tempList = [];
// //     final response = await       dio.get('https://dog.ceo/api/breeds/list/all');
// //     if(response.statusCode == 200){
// //       final jsonResponse = jsonDecode(response.data);
// //       jsonResponse['message'].forEach((breed,subbreed){
// //       });
// //     }
// //     else{
// //       throw Exception("Failed to load Dogs Breeds.");
// //     }
// //     setState(() {
// //       dogsBreedList = tempList;
// //       isLoading = false;
// //     });
// //   }
// }
import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import 'package:weather/src/constants/colors.dart';
import 'package:weather/src/model/current_temp_model.dart';

class Search extends StatefulWidget {
  final Current current;
  final Location location;
  const Search({super.key, required this.current, required this.location});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List  search = [ 'kochi'];
  @override
  void initState() {
    search.add(widget.location.region);
    search.add(" humidity: ${widget.current.humidity} ");
    search.add(" uv: ${widget.current.uv} ");
    search.add(" temp F: ${widget.current.tempF} ");
    search.add(" temp C: ${widget.current.tempC} ");
    search.add(" wind Mph: ${widget.current.windMph} ");
    search.add(" wind Direction: ${widget.current.windDir} ");
    search.add(" wind Kph: ${widget.current.windKph} ");
    search.add(" cloud: ${widget.current.cloud} ");
    search.add(" wind degree: ${widget.current.windDegree} ");
    search.add(" ${widget.location.region} ");
    search.add("local time: ${widget.location.localtime} ");
    search.add("latitude: ${widget.location.lat} ");

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colours.backgroundWhite,
      body: ListView.builder(
        itemCount: search.length,
        itemBuilder: (context, index) {
          final person = search[index];

          return ListTile(
            title: Text(person,style: const TextStyle(
              color: Colours.blue
            ),),

          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colours.blue,
        tooltip: 'Search ',
        onPressed: () => showSearch(
          context: context,
          delegate: SearchPage(
            barTheme: ThemeData(
              backgroundColor: Colours.blue,
              scaffoldBackgroundColor: Colours.backgroundWhite,
              bottomAppBarColor: Colours.blue

            ),
            onQueryUpdate: print,
            items: search,
            searchLabel: 'Search ',
            suggestion: const Center(
              child: Text('seach details',style: TextStyle(
                color: Colours.blue
              ),),
            ),
            failure: const Center(
              child: Text('No keyword found ',
                  style: TextStyle(
                  color: Colours.blue
              )
              ),
            ),
            filter: (searchDetails) => [
              searchDetails,
            ],
            sort: (a, b) => a.compareTo(b),
            builder: (person) => ListTile(
              title: Text(person),

            ),
          ),
        ),
        child: const Icon(Icons.search),
      ),
    );

  }
}
