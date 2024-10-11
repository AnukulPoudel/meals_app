import 'package:flutter/material.dart';
import 'package:meals_self/models/meals.dart';
import 'package:meals_self/screens/meals_details.dart';
import 'package:meals_self/widgets/meal_item.dart';

class Meals extends StatelessWidget {
  const Meals(
      {super.key, required this.meals, 
      // required this.onToggleFavouriteMeal
      });

  final List<Meal> meals;
  // final Function(Meal meal) onToggleFavouriteMeal;

  void selectMeal(ctx, Meal meal) {
    Navigator.push(
        ctx,
        MaterialPageRoute(
            builder: (context) => MealsDetails(
                  meal: meal,
                  // onToggleFavouriteMeal: onToggleFavouriteMeal,
                )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ],
      ),
    );
    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemBuilder: ((context, index) => MealsItem(
              meal: meals[index],
              selectMeal: (meal) {
                selectMeal(context, meal);
              },
            )),
        itemCount: meals.length,
      );
    }
    return content;
  }
}
