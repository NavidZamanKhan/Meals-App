import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/widgets/switch.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: AppBar(title: const Text("Your Filters")),
      body: Column(
        children: [
          SizedBox(height: 8),
          CustomSwitch(
            title: "Gluten-free",
            subtitle: "Only include gluten free meals",
            isChecked: ref.watch(filtersProvider)[Filters.glutenFree] ?? false,
            onChanged: (glutenFree) {
              ref
                  .read(filtersProvider.notifier)
                  .updateFilter(Filters.glutenFree, glutenFree);
            },
          ),
          CustomSwitch(
            title: "Lactose-free",
            subtitle: "Only include lactose free meals",
            isChecked: ref.watch(filtersProvider)[Filters.lactoseFree] ?? false,
            onChanged: (lactoseFree) {
              ref
                  .read(filtersProvider.notifier)
                  .updateFilter(Filters.lactoseFree, lactoseFree);
            },
          ),
          CustomSwitch(
            title: "Vegetarian",
            subtitle: "Only include Vegetarian meals",
            isChecked: ref.watch(filtersProvider)[Filters.vegetarian] ?? false,
            onChanged: (vegetarian) {
              ref
                  .read(filtersProvider.notifier)
                  .updateFilter(Filters.vegetarian, vegetarian);
            },
          ),
          CustomSwitch(
            title: "Vegan",
            subtitle: "Only include Vegan meals",
            isChecked: ref.watch(filtersProvider)[Filters.vegan] ?? false,
            onChanged: (vegan) {
              ref
                  .read(filtersProvider.notifier)
                  .updateFilter(Filters.vegan, vegan);
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
