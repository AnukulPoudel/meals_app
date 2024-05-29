import 'package:flutter/material.dart';
import 'package:meals_self/models/meals.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsItem extends StatelessWidget {
  const MealsItem({super.key, required this.meal, required this.selectMeal});

  final void Function(Meal meal) selectMeal;
  final Meal meal;

  String get textComplexity {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            selectMeal(meal);
          },
          child: Stack(
            children: [
              FadeInImage(
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 44,
                    vertical: 6,
                  ),
                  color: Colors.black54,
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        softWrap: true,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon
                          Row(
                            children: [
                              const Icon(
                                Icons.timer_outlined,
                                size: 17,
                              ),
                              Text(
                                ' ${meal.duration} min',
                                style: const TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          // Difficulty
                          const SizedBox(
                            width: 12,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.shop_outlined,
                                size: 17,
                              ),
                              Text(
                                '  $textComplexity',
                                style: const TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          // Affordable
                          Row(
                            children: [
                              const Icon(
                                Icons.attach_money_outlined,
                                size: 17,
                              ),
                              Text(
                                affordabilityText,
                                style: const TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
