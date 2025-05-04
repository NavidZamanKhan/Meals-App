import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/widgets/switch.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    final filtersNotifier = ref.read(filtersProvider.notifier);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: AppBar(title: const Text("Your Filters")),
      body: Column(
        children: [
          SizedBox(height: 8),
          CustomSwitch(
            title: "Gluten-free",
            subtitle: "Only include gluten free meals",
            isChecked: activeFilters[Filters.glutenFree] ?? false,
            onChanged: (glutenFree) {
              filtersNotifier.updateFilter(Filters.glutenFree, glutenFree);
            },
          ),
          CustomSwitch(
            title: "Lactose-free",
            subtitle: "Only include lactose free meals",
            isChecked: activeFilters[Filters.lactoseFree] ?? false,
            onChanged: (lactoseFree) {
              filtersNotifier.updateFilter(Filters.lactoseFree, lactoseFree);
            },
          ),
          CustomSwitch(
            title: "Vegetarian",
            subtitle: "Only include Vegetarian meals",
            isChecked: activeFilters[Filters.vegetarian] ?? false,
            onChanged: (vegetarian) {
              filtersNotifier.updateFilter(Filters.vegetarian, vegetarian);
            },
          ),
          CustomSwitch(
            title: "Vegan",
            subtitle: "Only include Vegan meals",
            isChecked: activeFilters[Filters.vegan] ?? false,
            onChanged: (vegan) {
              filtersNotifier.updateFilter(Filters.vegan, vegan);
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
