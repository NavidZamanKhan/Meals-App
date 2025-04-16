import 'package:flutter/material.dart';
import 'package:meals_app/main.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detailes.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.onToggleFavorite,
  });

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  // Navigates to the meal details screen.
  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (ctx) => MealDetailsScreen(
              meal: meal,
              onToggleFavorite: onToggleFavorite,
            ),
      ),
    );
  }

  // Builds the UI for the meals screen.
  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Uh oh! No meals found.",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Try selecting a different category.",
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(color: theme.colorScheme.onSurface),
          ),
        ],
      ),
    );

    // Displays a list of meals if available, otherwise shows a fallback message.
    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return MealItem(
            meal: meals[index],
            onSelectMeal: (meal) => selectMeal(context, meals[index]),
          );
        },
      );
    }

    // Returns the content directly if no title is provided, otherwise wraps it in a Scaffold with an AppBar.
    if (title == null) {
      return content;
    } else {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        appBar: AppBar(title: Text(title!)),
        body: content,
      );
    }
  }
}
