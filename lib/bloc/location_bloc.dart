import 'dart:async';

import 'package:resturants_with_bloc_app/DataLayer/location.dart';
import 'package:resturants_with_bloc_app/bloc/bloc_interface.dart';



class LocationBloc implements Bloc {
  Location _location;
  Location get selectedLocation => _location;

  final _locationController = StreamController<Location>();

  Stream<Location> get locationStream => _locationController.stream;

  void selectLocation(Location location) {
    _location = location;
    _locationController.sink.add(location);
  }

  @override
  void dispose() {
    _locationController.close();
  }
}
