import 'package:flutter/cupertino.dart';
import 'package:project_alta/Data_API/kategori_data.dart';
import 'package:project_alta/Model/katgori_model.dart';

class HomeViewModel extends ChangeNotifier {
  List<CategorieModel> categories = [];
  getcategories() async {
    final getcatergories = await CategorieData().getcategories();
    categories = getcatergories;
    notifyListeners();
  }
}
