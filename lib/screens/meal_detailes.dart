import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/widgets/cooking_steps.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  // Builds the UI for the meal details screen.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Retrieves the list of favorite meals from the provider.
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    // Checks if the current meal is a favorite.
    final isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleFavoriteMealStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  margin: const EdgeInsets.all(16),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 8,
                  duration: const Duration(seconds: 4),
                  content: Text(
                    wasAdded
                        ? "Added to favorites!"
                        : "Removed from favorites!",
                  ),
                ),
              );
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, Animation) {
                return RotationTransition(
                  turns: Tween<double>(begin: 0.8, end: 1).animate(Animation),
                  child: child,
                );
              },
              child: Icon(
                !isFavorite ? Icons.star_border : Icons.star,
                key: ValueKey(isFavorite),
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Hero(
              tag: meal.id,
              child: Material(
                color: Colors.transparent,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: FadeInImage(
                        fadeInDuration: const Duration(milliseconds: 400),
                        placeholder: MemoryImage(kTransparentImage),
                        image: NetworkImage(meal.imageUrl),
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        color: Colors.black54,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          meal.title,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(
                            context,
                          ).textTheme.headlineSmall!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryFixedDim,
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Theme.of(
                      context,
                    ).colorScheme.primaryFixedDim.withOpacity(1),
                    Theme.of(
                      context,
                    ).colorScheme.primaryFixedDim.withOpacity(0),
                  ],
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Text(
                    "Let's make: ${meal.title}",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  CookingSteps(meal: meal),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
