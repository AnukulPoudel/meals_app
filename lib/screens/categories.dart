import 'package:flutter/material.dart';
import 'package:meals_self/data/dummy_data.dart';
import 'package:meals_self/models/categories.dart';
import 'package:meals_self/models/meals.dart';
import 'package:meals_self/screens/meals.dart';
import 'package:meals_self/widgets/categorie_grid_items.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key,
      // required this.onToggleFavouriteMeal,
      required this.availableMeals});

  final List<Meal> availableMeals;
  // final void Function(Meal meal) onToggleFavouriteMeal;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          dummyMeals: filteredMeals,
          // onToggleFavouriteMeal: onToggleFavouriteMeal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        for (final categorie in availableCategories)
          CategorieGridItems(
            categories: categorie,
            onSelectCategory: () {
              _selectCategory(context, categorie);
            },
          )
      ],
    );
  }
}
