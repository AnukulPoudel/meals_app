import "package:flutter_riverpod/flutter_riverpod.dart";
import "../models/meals.dart";

// the name of the class should end in Notifier -> FavouriteMealsNotifier
// FavouriteMealsNotifier is a generic class
class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  // the initial list
  // constructor function, : -> initializer
  FavouriteMealsNotifier()
      : super([]); // super to reach to our parent class -> StateNotifier()
  // and all the necessary methods to update those values inside list
  bool toggleMealFavouriteStatus(Meal meal) {
    // return bool to find out weather it was added or not
    // .contains checks if state list is same as meal
    final mealIsFavourite = state.contains(meal);

    // if meal is fav we need to remove the element without using remove
    if (mealIsFavourite) {
      // .where gives us a new list
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    }
    // adding a meal
    else {
      // spead operator ...,  pull out all the elements from that state list and add new meal using ,
      state = [...state, meal];
      return true;
    }
    // globally available state property, we cannot add or remove values form list like in
    // notmal cases so we must always create a new one
  }
}

// used for dynamic datas that keeps changing
// returns an instance of our FavouriteMealsNotifier class
final favouriteMealsProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>((ref) {
  // StateNotifierProvider is a generic type so it does not which data
  //  this favouriteMealsNotifier will yield in the end so <>, adding this to get better type support for rest of app
  return FavouriteMealsNotifier();
});
