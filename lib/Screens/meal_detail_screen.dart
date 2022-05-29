// ignore_for_file: prefer_const_constructors


import 'package:app_receitas/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
  
  final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title!),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Detalhe da Refeição'),
      ),
    );
  }
}