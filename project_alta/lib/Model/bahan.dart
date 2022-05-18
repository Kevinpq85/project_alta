class IngredientModel {
  List<Meals>? meals;

  IngredientModel({this.meals});

  IngredientModel.fromJson(Map<String, dynamic> json) {
    if (json['meals'] != null) {
      meals = <Meals>[];
      json['meals'].forEach((v) {
        meals!.add(Meals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meals != null) {
      data['meals'] = meals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meals {
  String? idIngredient;
  String? strType;

  Meals({this.idIngredient, this.strType});

  Meals.fromJson(Map<String, dynamic> json) {
    idIngredient = json['idIngredient'];
    strType = json['strType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idIngredient'] = idIngredient;
    data['strType'] = strType;
    return data;
  }
}
