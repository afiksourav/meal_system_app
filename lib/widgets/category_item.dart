import 'package:flutter/material.dart';
import 'package:meal_system_app/screens/category_meals_screen.dart';

class CatogoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CatogoryItem(this.id, this.title, this.color, {super.key});

 void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context ) {
    return InkWell(
      
      onTap: () => selectCategory(context),
      
      splashColor: Theme.of(context).primaryColor,
      // borderRadius: BorderRadius.circular(15),
      child: GestureDetector(
    
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              // begin: Alignment.topLeft,
              // end: Alignment.bottomRight,
              colors: [
                color.withOpacity(0.7),
                color,
              ],
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child:  Text(
            title,
            style: const TextStyle(
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
