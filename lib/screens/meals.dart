import 'package:flutter/material.dart';
import 'package:meals_self/models/meals.dart';
import 'package:meals_self/widgets/meal_items.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.dummyMeals});

  final String? title;
  final List<Meal> dummyMeals;

  @override
  Widget build(BuildContext context) {
    if (title == null) {
      return Meals(
        meals: dummyMeals,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Meals(
        meals: dummyMeals,
      ),
    );
  }
}
