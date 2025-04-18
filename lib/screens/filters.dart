import 'package:flutter/material.dart';
import 'package:meals_app/widgets/switch.dart';

enum Filters { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: AppBar(title: const Text("Your Filters")),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          Navigator.of(context).pop({
            Filters.glutenFree: _glutenFreeFilterSet,
            Filters.lactoseFree: _lactoseFreeFilterSet,
            Filters.vegetarian: _vegetarianFilterSet,
            Filters.vegan: _veganFilterSet,
          });
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
              onChanged: (lactose_free) {
                setState(() {
                  _lactoseFreeFilterSet = lactose_free;
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
