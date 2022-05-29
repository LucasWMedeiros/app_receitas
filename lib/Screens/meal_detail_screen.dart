// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Refeição'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Detalhe da Refeição'),
      ),
    );
  }
}