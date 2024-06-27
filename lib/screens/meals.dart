import 'package:flutter/material.dart';
import 'package:meals_self/models/meals.dart';
import 'package:meals_self/widgets/meal_items.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      this.title,
      required this.dummyMeals,
      required this.onToggleFavouriteMeal});

  final String? title;
  final List<Meal> dummyMeals;
  final void Function(Meal meal) onToggleFavouriteMeal;

  @override
  Widget build(BuildContext context) {
    if (title == null) {
      return Meals(
        meals: dummyMeals,
        onToggleFavouriteMeal: onToggleFavouriteMeal,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Meals(
        meals: dummyMeals,
        onToggleFavouriteMeal: onToggleFavouriteMeal,
      ),
    );
  }
}
