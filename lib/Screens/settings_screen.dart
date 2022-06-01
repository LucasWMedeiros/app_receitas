// ignore_for_file: prefer_const_constructors

import 'package:app_receitas/Components/main_drawer.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Configurações'),
      ),
    );
  }
}