import 'package:dio/dio.dart';
import 'package:project_alta/Model/katgori_model.dart';

class CategorieData {
  Future<List<CategorieModel>> getcategories() async {
    final Response response = await Dio()
        .get('https://www.themealdb.com/api/json/v1/1/categories.php');

    final responseData = (response.data['categories'] as List)
        .map((e) => CategorieModel(
            idCategory: e['idCategory'],
            strCategory: e['strCategory'],
            strCategoryDescription: e['strCategoryDescription'],
            strCategoryThumb: e['strCategoryThumb']))
        .toList();
    return responseData;
  }
}
