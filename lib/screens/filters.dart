import 'package:flutter/material.dart';

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
      appBar: AppBar(title: const Text("Your Filters")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              borderRadius: BorderRadius.circular(16),
              clipBehavior: Clip.antiAlias,
              color: Theme.of(context).colorScheme.secondaryContainer,
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
                hoverColor: Theme.of(context).colorScheme.primary,
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
