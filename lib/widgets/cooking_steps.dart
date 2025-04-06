import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class CookingSteps extends StatelessWidget {
  const CookingSteps({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ingredients:",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w900,
              ),
            ),
            for (var ingredient in meal.ingredients)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ingredient,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
          ],
        ),
        SizedBox(height: 16),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Steps:",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var step in meal.steps)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      step,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
