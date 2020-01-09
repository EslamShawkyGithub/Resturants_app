import 'package:flutter/material.dart';
import 'package:resturants_with_bloc_app/bloc/bloc_provider.dart';
import 'package:resturants_with_bloc_app/bloc/favorite_bloc.dart';
import 'package:resturants_with_bloc_app/ui/location_screen.dart';
import 'package:resturants_with_bloc_app/ui/restaurant_screen.dart';

import 'DataLayer/location.dart';
import 'bloc/location_bloc.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // inject BlocProvider in widgets
    return BlocProvider<LocationBloc>(
      bloc: LocationBloc(),
      child: BlocProvider<FavoriteBloc>(
        bloc: FavoriteBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Restaurant Finder',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: MainScreen(),
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {

    // StreamBuilders These widgets will automatically listen for events from the stream.
    //When a new event is received, the builder closure will be executed and updating the widget tree.
    return StreamBuilder<Location>(
      stream: BlocProvider.of<LocationBloc>(context).locationStream,
      builder: (context , snapshot){
        final location = snapshot.data;
        if(location == null){
          return LocationScreen();
        }
        return RestaurantScreen(location:location);
      },
    );
  }
}
