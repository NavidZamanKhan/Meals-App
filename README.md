Here's the exact same content converted to proper markdown format:

# Meals App

A Flutter application that helps users discover, filter, and save their favorite meals. The app provides a comprehensive meal catalog with detailed recipes, ingredients, and cooking instructions.

## Features

- **Meal Categories**: Browse meals by different categories
- **Detailed Meal Information**: View comprehensive details for each meal including:
  - Ingredients list
  - Step-by-step cooking instructions
  - Duration
  - Complexity level
  - Affordability rating
  - Dietary restrictions (Gluten-free, Lactose-free, Vegan, Vegetarian)
- **Favorites System**: Save and manage favorite meals
- **Advanced Filtering**: Filter meals based on:
  - Dietary preferences
  - Complexity level
  - Affordability
- **Modern UI**: Clean and intuitive user interface with:
  - Bottom navigation
  - Custom drawer menu
  - Responsive grid layouts
  - Beautiful typography using Google Fonts

## Technical Architecture

### Project Structure

```
lib/
├── data/
│   └── dummy_data.dart       # Sample meal data
├── models/
│   ├── category.dart         # Category model
│   └── meal.dart            # Meal model with enums
├── providers/
│   ├── favorites_provider.dart
│   ├── filters_provider.dart
│   └── meals_provider.dart
├── screens/
│   ├── categories.dart
│   ├── filters.dart
│   ├── meal_detailes.dart
│   ├── meals.dart
│   └── tabs.dart
├── widgets/
│   ├── category_grid_item.dart
│   ├── cooking_steps.dart
│   ├── main_drawer.dart
│   ├── meal_item.dart
│   ├── meal_item_trait.dart
│   └── switch.dart
└── main.dart
```

### Key Components

1. **State Management**

   - Uses Riverpod for state management
   - Separate providers for meals, favorites, and filters

2. **UI Components**

   - Custom widgets for meal items and categories
   - Reusable components for cooking steps and traits
   - Custom drawer for navigation
   - Bottom navigation for main sections

3. **Theme**
   - Material 3 design system
   - Custom color scheme with primary color: RGB(29, 164, 140)
   - Google Fonts (Lato) integration
   - Consistent styling for app bars and navigation

## Dependencies

- Flutter
- flutter_riverpod: For state management
- google_fonts: For typography

## Getting Started

1. Ensure you have Flutter installed on your system
2. Clone the repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the application

## Features in Detail

### Meal Details

- Comprehensive meal information display
- Step-by-step cooking instructions
- Ingredient lists
- Dietary information
- Duration and complexity indicators

### Filtering System

- Toggle filters for dietary preferences
- Filter by meal complexity
- Filter by affordability
- Real-time filtering of meal list

### Favorites

- Add/remove meals from favorites
- Persistent storage of favorite meals
- Quick access to favorite meals

### Navigation

- Bottom navigation for main sections
- Drawer menu for additional options
- Smooth transitions between screens

## Design

The app follows Material Design 3 guidelines with:

- Custom color scheme
- Consistent typography
- Responsive layouts
- Intuitive navigation
- Clear visual hierarchy

This README provides a comprehensive overview of the Meals App, its features, architecture, and technical details. The app is designed to be user-friendly while providing powerful functionality for meal discovery and management.
