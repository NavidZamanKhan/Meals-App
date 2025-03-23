import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class CookingSteps extends StatelessWidget {
  const CookingSteps({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ingredients:",
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: Colors.black),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
