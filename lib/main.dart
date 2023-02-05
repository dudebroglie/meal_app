import 'package:flutter/material.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/catergories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GaliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                headline5: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                subtitle1: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              )),
      home: CatergoriesScreen(),
      routes: {
        './': (ctx) => CatergoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        //if (settings.name == '/meal-detal'){
        //  return ...;
        //} else if (settings.name == '/something-else'){
        //  return ...;
        //}
        //return MaterialPageRoute(builder: (ctx) => CatergoriesScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CatergoriesScreen());
      },
    );
  }
}
