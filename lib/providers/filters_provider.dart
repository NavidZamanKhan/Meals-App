import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/screens/filters.dart';


enum Filters { glutenFree, lactoseFree, vegetarian, vegan }


class FiltersNotifier extends StateNotifier<Map<Filters, bool>> {
  FiltersNotifier()
      : super({
          Filters.glutenFree: false,
          Filters.lactoseFree: false,
          Filters.vegetarian: false,
          Filters.vegan: false,
      });
      void setFilters(Filters filter, bool isActive) {
        state = {
          ...state,
          filter: isActive,
        };
      }
}

final filtersProvider = StateNotifierProvider((ref) {
  return null;
}) 