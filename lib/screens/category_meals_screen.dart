import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/meal_items.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  //final String categoryId;
  //final String categoryTitle;

  //CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final catergoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final CategoryMeals = DUMMY_MEALS.where(((meal) {
      return meal.categories.contains(categoryId);
    })).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(catergoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: CategoryMeals[index].id,
            title: CategoryMeals[index].title,
            imageUrl: CategoryMeals[index].imageUrl,
            duration: CategoryMeals[index].duration,
            complexity: CategoryMeals[index].complexity,
            affordability: CategoryMeals[index].affordability,
          );
        },
        itemCount: CategoryMeals.length,
      ),
    );
  }
}
