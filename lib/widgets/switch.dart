import 'package:flutter/material.dart';

// Rename the class to CustomSwitch to avoid conflict with Flutter's Switch widget
class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isChecked,
    required this.onChanged,
  });

  final String title;
  final String subtitle;
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).colorScheme.surface,
        child: SwitchListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              fontWeight: FontWeight.w900,
              fontSize: 20,
            ),
          ),
          subtitle: Text(
            subtitle,
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
          activeTrackColor: Theme.of(context).colorScheme.primaryContainer,
          contentPadding: const EdgeInsets.only(left: 16, right: 16),
          value: isChecked,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
