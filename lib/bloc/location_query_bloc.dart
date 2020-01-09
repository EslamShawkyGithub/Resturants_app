import 'dart:async';

import 'package:resturants_with_bloc_app/DataLayer/location.dart';
import 'package:resturants_with_bloc_app/DataLayer/zomato_client.dart';
import 'package:resturants_with_bloc_app/bloc/bloc_interface.dart';


class LocationQueryBloc implements Bloc {
  final _client = ZomatoClient();
  final _controller = StreamController<List<Location>>();

  Stream<List<Location>> get locationStream => _controller.stream;

  void submitQuery(String query) async {
    final result = await _client.fetchLocations(query);
    _controller.sink.add(result);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
