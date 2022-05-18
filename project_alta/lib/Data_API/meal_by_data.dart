import 'package:dio/dio.dart';
import 'package:project_alta/Model/meal_by_kategori_model.dart';

class MealByData {
  static Future<List<MealsByCategorie>> getMealByCategori(
      String categoryName) async {
    Response response = await Dio().get(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=$categoryName');

    return (response.data['meals'] as List)
        .map((e) => MealsByCategorie.fromJson(e))
        .toList();
  }

  static Future<List<MealsByCategorie>> getMealByArea(String areaName) async {
    Response response = await Dio()
        .get('https://www.themealdb.com/api/json/v1/1/filter.php?a=$areaName');

    return (response.data['meals'] as List)
        .map((e) => MealsByCategorie.fromJson(e))
        .toList();
  }
}
