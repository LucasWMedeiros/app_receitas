// ignore_for_file: prefer_const_constructors, unnecessary_import, deprecated_member_use, prefer_final_fields

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

  void _filterMeals(Settings settings){
    setState(() {
      this.settings = settings;
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree! && !meal.isGlutenFree!;
        final filterLactose = settings.isLactoseFree! && !meal.isLactoseFree!;
        final filterVegan = settings.isVegan! && !meal.isVegan!;
        final filterVegetarian = settings.isVegetarian! && !meal.isVegetarian!;
        return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;
      }).toList();
    });
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
          )
        )
      ),
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(),
        AppRoutes.CATEGORY_MEALS: (ctx) => CategoriesMealsScrean(_availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
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
      )
    );
  }
}