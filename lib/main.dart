// ignore_for_file: prefer_const_constructors, unnecessary_import, deprecated_member_use

import 'package:app_receitas/Screens/categories_screen.dart';
import 'package:app_receitas/Screens/categoris_meals_screen.dart';
import 'package:app_receitas/utils/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

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
        AppRoutes.HOME: (ctx) => CategoriesScreen(),
        AppRoutes.CATEGORY_MEALS: (ctx) => CategoriesMealsScrean()
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