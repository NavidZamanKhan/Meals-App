import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/widgets/switch.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    // Initialize the filter sets with the current filters
    final activeFilters = ref.read(filtersProvider);
    _glutenFreeFilterSet = activeFilters[Filters.glutenFree]!;
    _lactoseFreeFilterSet = activeFilters[Filters.lactoseFree]!;
    _vegetarianFilterSet = activeFilters[Filters.vegetarian]!;
    _veganFilterSet = activeFilters[Filters.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: AppBar(title: const Text("Your Filters")),
      body: PopScope(
        canPop: true,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          ref.read(filtersProvider.notifier).setFilters({
            Filters.glutenFree: _glutenFreeFilterSet,
            Filters.lactoseFree: _lactoseFreeFilterSet,
            Filters.vegetarian: _vegetarianFilterSet,
            Filters.vegan: _veganFilterSet,
          });
          if (didPop) return;
        },
        child: Column(
          children: [
            SizedBox(height: 8),
            CustomSwitch(
              title: "Gluten-free",
              subtitle: "Only include gluten free meals",
              isChecked: _glutenFreeFilterSet,
              onChanged: (glutenFree) {
                setState(() {
                  _glutenFreeFilterSet = glutenFree;
                });
              },
            ),
            CustomSwitch(
              title: "Lactose-free",
              subtitle: "Only include lactose free meals",
              isChecked: _lactoseFreeFilterSet,
              onChanged: (lactoseFree) {
                setState(() {
                  _lactoseFreeFilterSet = lactoseFree;
                });
              },
            ),
            CustomSwitch(
              title: "Vegetarian",
              subtitle: "Only include Vegetarian meals",
              isChecked: _vegetarianFilterSet,
              onChanged: (vegetarian) {
                setState(() {
                  _vegetarianFilterSet = vegetarian;
                });
              },
            ),
            CustomSwitch(
              title: "Vegan",
              subtitle: "Only include Vegan meals",
              isChecked: _veganFilterSet,
              onChanged: (vegan) {
                setState(() {
                  _veganFilterSet = vegan;
                });
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
