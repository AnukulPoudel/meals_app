import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_self/data/dummy_data.dart';

// better for data that is static that doesnot change
final mealsProvider = Provider((ref) {
  return dummyMeals;
});
