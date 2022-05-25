// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CategoriesMealsScrean extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receitas'),
      ),
      body: Center(
        child: Text('Receitas por Categoria'),
      ),
    );
  }
}