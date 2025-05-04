import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';

/// Enum representing available dietary filter options.
enum Filters { glutenFree, lactoseFree, vegetarian, vegan }

/// A StateNotifier that manages the current state of active dietary filters.
class FiltersNotifier extends StateNotifier<Map<Filters, bool>> {
  FiltersNotifier()
    : super({
        Filters.glutenFree: false,
        Filters.lactoseFree: false,
        Filters.vegetarian: false,
        Filters.vegan: false,
      });

  /// Updates the state of a single filter.
  void updateFilter(Filters filter, bool isActive) {
    state = {...state, filter: isActive};
  }

  /// Replaces all filters with a new set of chosen filters.
  void setFilters(Map<Filters, bool> chosenFilters) {
    state = chosenFilters;
  }
}

/// Provides and manages the user's selected dietary filters.
final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filters, bool>>((ref) {
      return FiltersNotifier();
    });

///
///
/// A provider that filters meals based on the active filters set by the user.
///
/// This provider listens to two other providers:
/// - `mealProvider`: Provides the list of all available meals.
/// - `filtersProvider`: Provides the currently active filters.
///
/// The filtering logic checks each meal against the active filters:
/// - If the `glutenFree` filter is active, only gluten-free meals are included.
/// - If the `lactoseFree` filter is active, only lactose-free meals are included.
/// - If the `vegetarian` filter is active, only vegetarian meals are included.
/// - If the `vegan` filter is active, only vegan meals are included.
///
/// Meals that satisfy all the active filters are returned as a filtered list.
final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealProvider);
  final activeFilters = ref.watch(filtersProvider);
  return meals.where((meal) {
    if (activeFilters[Filters.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filters.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filters.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filters.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
