// ignore_for_file: prefer_const_constructors

import 'package:app_receitas/models/meal.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {

  final Meal meal;

  const MealItem(this.meal);

  void _selectMeal(){}

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: _selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(meal.imageUrl!,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}