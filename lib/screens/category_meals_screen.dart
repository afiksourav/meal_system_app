import 'package:flutter/material.dart';
import 'package:meal_system_app/models/meal.dart';
import 'package:meal_system_app/widgets/meal_item.dart';


class CategoryMealScreen extends StatefulWidget {
  
static const routeName = '/category-meals';

final List<Meal> _availableMeals;
CategoryMealScreen(this._availableMeals);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

   late String categoryTitle;
   late List <Meal> displayedMeals;
   var _loadedIniData = false;


  @override
  void didChangeDependencies() {  //state object change? delete/ update korte hole didChangeDependencies r sateful use korte hoy
    if(!_loadedIniData){

   final routeArgs=ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    categoryTitle  = routeArgs['title'] as String;
    final categoryId = routeArgs['id'];

    displayedMeals = widget._availableMeals.where((meal){
      return meal.categories.contains(categoryId); // itemcount er total length ber korar jonno eta kora hoicay
    }).toList();

    _loadedIniData= true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String MealId){
     setState(() {
       displayedMeals.removeWhere((meal) => meal.id == MealId);
     });
  }


  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
      title: Text(categoryTitle as String),
      ),
      body: ListView.builder(itemBuilder: (ctx, index ){
     
     return MealItem(
    id: displayedMeals[index].id,
     title: displayedMeals[index].title, 
     imageUrl: displayedMeals[index].imageUrl, 
     duration: displayedMeals[index].duration,
     complexity: displayedMeals[index].complexity,
     affordability: displayedMeals[index].affordability,
    
     );


      },itemCount:displayedMeals.length ,)
    );
  }
}