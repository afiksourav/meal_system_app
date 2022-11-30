import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meal_system_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
 

  static const routeName= '/meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);


  Widget buildSectionTitle(BuildContext context, String text ){
    return  Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          //padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(text,
          style: Theme.of(context).textTheme.headline1,
          ),
        );
  }

  Widget buildContainer(Widget child) {
    return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color.fromARGB(255, 71, 68, 68)),
            borderRadius: BorderRadius.circular(10),
            
          ),
          
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          
          height: 150 ,
          width: 300,
          child: child,
     );
  }

  @override
  Widget build(BuildContext context) {
    
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selecetedMeal = DUMMY_MEALS.firstWhere ((meal) => meal.id == mealId ,);

    return Scaffold(
      appBar: AppBar(title: Text(selecetedMeal.title)),
      body:SingleChildScrollView(
        child: Column(
          
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(selecetedMeal.imageUrl,
            fit: BoxFit.cover,
            ),
          ),
        buildSectionTitle(context, 'Ingredients') ,
          
          buildContainer(
            ListView.builder(
              itemBuilder: (ctx, index)=> Card(
                color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  child: Text(selecetedMeal.ingredients[index]),
                ),
              ),
              itemCount: selecetedMeal.ingredients.length,
            ),
          ),
           buildSectionTitle(context, 'Steps') ,
           buildContainer(ListView.builder(
            itemBuilder: (ctx, index) => Column(
              children: [
                ListTile(
                  leading: CircleAvatar(child: Text('# ${(index+1)}'),
                  ),
                  title: Text(selecetedMeal.steps[index],),
                ),
              Divider()
              ],
            ),
            itemCount: selecetedMeal.steps.length,
           ))
        ],
          ),
      ) ,
      floatingActionButton: FloatingActionButton(
        onPressed:()=> toggleFavorite(mealId),
        child: Icon(
          isFavorite(mealId) ? Icons.star :Icons.star_border,      
        ),
      ),
    ); 
    
    
  }
}