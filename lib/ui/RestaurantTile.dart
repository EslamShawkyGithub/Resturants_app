import 'package:flutter/material.dart';
import 'package:resturants_with_bloc_app/DataLayer/restaurant.dart';
import 'package:resturants_with_bloc_app/ui/restaurant_details_screen.dart';
import 'image_container.dart';

class RestaurantTile extends StatelessWidget {
  const RestaurantTile({
    Key key,
    @required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ImageContainer(width: 50, height: 50, url: restaurant.thumbUrl),
      title: Text(restaurant.name),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                RestaurantDetailsScreen(restaurant: restaurant),
          ),
        );
      },
    );
  }
}