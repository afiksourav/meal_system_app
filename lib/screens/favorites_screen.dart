import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meal_system_app/models/meal.dart';

import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
 final List<Meal> favoriteMeals;
 FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
    return Center(
      child: Text('The Favorites'),
    );
    } else { return ListView.builder(itemBuilder: (ctx, index ){
       return MealItem(
    id: favoriteMeals[index].id,
     title: favoriteMeals[index].title, 
     imageUrl: favoriteMeals[index].imageUrl, 
     duration: favoriteMeals[index].duration,
     complexity: favoriteMeals[index].complexity,
     affordability: favoriteMeals[index].affordability,
   
     );


      },itemCount:favoriteMeals.length ,);
    }
  }
}