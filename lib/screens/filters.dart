import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: AppBar(title: const Text("Your Filters")),
      drawer: MainDrawer(
        onSelectScreen: (identifier) {
          Navigator.pop(context);
          if (identifier == "meals") {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (ctx) => TabScreen()));
          }
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              borderRadius: BorderRadius.circular(16),
              clipBehavior: Clip.antiAlias,
              color: Theme.of(context).colorScheme.surface,
              child: SwitchListTile(
                title: Text(
                  "Gluten-free",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                  "Only include gluten-free meals",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    fontSize: 16,
                  ),
                ),

                trackOutlineColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return Theme.of(context).colorScheme.onTertiaryContainer;
                  } else {
                    return Theme.of(context).colorScheme.onSecondaryContainer;
                  }
                }),

                thumbColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return Theme.of(context).colorScheme.onTertiaryContainer;
                  } else {
                    return Theme.of(context).colorScheme.onSecondaryContainer;
                  }
                }),

                inactiveTrackColor: Theme.of(context).colorScheme.surface,
                activeColor: Theme.of(context).colorScheme.tertiary,

                activeTrackColor:
                    Theme.of(context).colorScheme.primaryContainer,
                contentPadding: const EdgeInsets.only(left: 16, right: 16),
                value: false,
                onChanged: (isChecked) {
                  setState(() {
                    _glutenFreeFilterSet = isChecked;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
