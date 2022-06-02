// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:app_receitas/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {

  _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _createSectionContainer(Widget child){
    return Container(
            width: 300,
            height: 250,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
                child: child,
                );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title!),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
              _createSectionTitle(context, 'Ingredientes'),
              _createSectionContainer(
               ListView.builder(
                itemCount: meal.ingredients!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(meal.ingredients![index]),
                    ),
                    color: Theme.of(context).accentColor,
                  );
                },
              ),
            ),
            _createSectionTitle(context, 'Modo de Preparo'),
            _createSectionContainer(
              ListView.builder(
                itemCount: meal.steps!.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: Text(meal.steps![index]),
                      ),
                      Divider()
                    ],
                  );
                },
              )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.star),
        onPressed: () => Navigator.of(context).pop(meal)
      ),
    );
  }
}
