import 'package:flutter/material.dart';
import 'package:meal_system_app/models/meal.dart';
import 'package:meal_system_app/screens/categories_screen.dart';
import 'package:meal_system_app/screens/favorites_screen.dart';
import 'package:meal_system_app/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {

  final List<Meal> favoriteMeals;
  TabScreen(this.favoriteMeals);
   
  @override
  State<TabScreen> createState() => _TabScreenState();
}
class _TabScreenState extends State<TabScreen> {
   
 late List<Map<String, dynamic>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Your Favorite',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'].toString()),
      ),
      drawer: MainDrawer(),
    body:(_pages[_selectedPageIndex]['page']),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage ,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 209, 10, 70),
            icon: Icon(Icons.category),
            label: 'Categories' 
          ),
           BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 209, 10, 70),
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
