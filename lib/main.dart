import 'package:app_receitas/Data/dummy_data.dart';
import 'package:app_receitas/Screens/categories_screen.dart';
import 'package:app_receitas/Screens/categoris_meals_screen.dart';
import 'package:app_receitas/Screens/meal_detail_screen.dart';
import 'package:app_receitas/Screens/settings_screen.dart';
import 'package:app_receitas/Screens/tabs_screen.dart';
import 'package:app_receitas/models/meal.dart';
import 'package:app_receitas/models/settings.dart';
import 'package:app_receitas/utils/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree! && !meal.isGlutenFree!;
        final filterLactose = settings.isLactoseFree! && !meal.isLactoseFree!;
        final filterVegan = settings.isVegan! && !meal.isVegan!;
        final filterVegetarian = settings.isVegetarian! && !meal.isVegetarian!;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _togleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal){
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepOrangeAccent,
          fontFamily: 'Raleway',
          canvasColor: Color.fromARGB(255, 234, 234, 207),
          textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ))),
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(_favoriteMeals),
        AppRoutes.CATEGORY_MEALS: (ctx) =>
            CategoriesMealsScrean(_availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(_togleFavorite, _isFavorite),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(_filterMeals, settings)
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Vamos Cozinhar?'),
        ),
        body: Center(
          child: Text('Navegar é preciso'),
        ));
  }
}
