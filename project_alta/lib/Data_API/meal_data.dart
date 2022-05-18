import 'package:dio/dio.dart';
import 'package:project_alta/Model/meal_model.dart';

class MealData {
  Future<List<MealModel>> getMealByFirstChar(String firstCharacter) async {
    Response response = await Dio().get(
        'https://www.themealdb.com/api/json/v1/1/search.php?f=$firstCharacter');

    return (response.data['meals'] as List)
        .map((e) => MealModel.fromJson(e))
        .toList();
  }

  static Future<List<MealModel>> getMealById(String id) async {
    Response response = await Dio()
        .get('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id');

    return (response.data['meals'] as List)
        .map((e) => MealModel.fromJson(e))
        .toList();
  }
}
