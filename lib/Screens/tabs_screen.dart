// ignore_for_file: prefer_const_constructors, deprecated_member_use
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:app_receitas/Components/main_drawer.dart';
import 'package:app_receitas/Screens/categories_screen.dart';
import 'package:app_receitas/Screens/favorite_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _seletedScreenIndex = 0;

  final List<Widget> _screens = [
    CategoriesScreen(),
    FavoriteScreen(),
  ];
  final List<String> _title = [
    'Lista de Categorias',
    'Meus Favoritos'
  ];

  _selectScreen(int index){
    setState(() {
      _seletedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title[_seletedScreenIndex]),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: _screens[_seletedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _seletedScreenIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favoritos',
          )
        ],
      ),
    );
  }
}
