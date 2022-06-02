// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:app_receitas/Components/meal_item.dart';
import 'package:app_receitas/Data/dummy_data.dart';
import 'package:app_receitas/models/category.dart';
import 'package:app_receitas/models/meal.dart';
import 'package:flutter/material.dart';

class CategoriesMealsScrean extends StatelessWidget {

  final List<Meal> meals;

  const CategoriesMealsScrean(this.meals);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeals = DUMMY_MEALS.where((meal){
      return meal.categories!.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title!),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: ((ctx, index) {
            return MealItem(categoryMeals[index]);
          })),
      ),
    );
  }
}