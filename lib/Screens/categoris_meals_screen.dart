// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:app_receitas/models/category.dart';
import 'package:flutter/material.dart';

class CategoriesMealsScrean extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title!),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Receitas por Categoria'),
      ),
    );
  }
}