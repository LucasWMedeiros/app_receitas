// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:app_receitas/Screens/categories_screen.dart';
import 'package:app_receitas/Screens/favorite_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Vamos Cozinhar?'),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.category),
              text: 'Categorias',
            ),
            Tab(
              icon: Icon(Icons.star),
              text: 'Favoritos',
            )
          ]),
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavoriteScreen()
          ],
        ),
      ),
    );
  }
}