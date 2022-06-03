// ignore_for_file: prefer_const_constructors

import 'package:app_receitas/Components/meal_item.dart';
import 'package:app_receitas/models/meal.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {

    if(favoriteMeals.isEmpty) {
    return Center(
      child: Text('Minhas comidas favoritas'),
    );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (context, index){
          return MealItem(favoriteMeals[index]);
        });
    }

  }
}