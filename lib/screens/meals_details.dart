import 'package:flutter/material.dart';
import 'package:meals_self/models/meals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/favourite_meals_provider.dart';

class MealsDetails extends ConsumerWidget {
  const MealsDetails({
    super.key,
    required this.meal,
    // required this.onToggleFavouriteMeal
  });

  // final void Function(Meal meal) onToggleFavouriteMeal;

  final Meal meal;

  @override
  // This is a stateless wid so we need to pass the fun parameter manually its not globally aailable
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              // onToggleFavouriteMeal(meal);
              // here we should not use .watch. in functions like onPressed we should use .read not .watch
              final wasAdded = ref
                  .read(favouriteMealsProvider.notifier)
                  .toggleMealFavouriteStatus(meal);
              // since favouriteMealsProvider is a stateNotifier we can access the value using . notifier
              // which gives us access to the notifier class inside favourite..provider
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 4),
                  content: Text(wasAdded
                      ? 'Meal added as a favourite'
                      : 'Meal removed as a favourite'),
                ),
              );
            },
            icon: const Icon(Icons.star),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Ingredients',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 192, 5),
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Steps',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 192, 5),
                fontSize: 24,
              ),
            ),
            for (final step in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
