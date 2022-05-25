import 'package:app_receitas/models/category.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {

  final Category category;

  CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Text(category.title!),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            category.color!.withOpacity(0.5),
            category.color!,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        )
      ),
    );
  }
}