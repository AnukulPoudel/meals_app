import 'package:flutter/material.dart';
import 'package:meals_self/models/meals.dart';

class MealsDetails extends StatelessWidget {
  const MealsDetails({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
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
