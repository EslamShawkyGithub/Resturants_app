import 'package:flutter/material.dart';
import 'package:resturants_with_bloc_app/DataLayer/restaurant.dart';
import 'package:resturants_with_bloc_app/bloc/bloc_provider.dart';
import 'package:resturants_with_bloc_app/bloc/favorite_bloc.dart';


import 'RestaurantTile.dart';

class FavoriteScreen  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<FavoriteBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: StreamBuilder<List<Restaurant>>(
        initialData: bloc.favorites,
          stream: bloc.favoritesStream,
          builder: (context , snapshot){
            List<Restaurant> favorites =
            (snapshot.connectionState == ConnectionState.waiting)
                ? bloc.favorites
                : snapshot.data;

            if (favorites == null || favorites.isEmpty) {
              return Center(child: Text('No Favorites'));
            }
            return ListView.separated(

                separatorBuilder: (context, index) => Divider(),
                itemCount: favorites.length,
            itemBuilder: (context , index){
              final restaurant = favorites[index];
              return RestaurantTile(restaurant: restaurant);
            },
            );

          }),
    );
  }
}
