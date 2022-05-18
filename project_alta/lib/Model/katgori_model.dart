class CategorieModel {
  String idCategory;
  String strCategory;
  String strCategoryThumb;
  String strCategoryDescription;

  CategorieModel(
      {required this.idCategory,
      required this.strCategory,
      required this.strCategoryDescription,
      required this.strCategoryThumb});

  factory CategorieModel.fromJson(Map<String, dynamic> json) => CategorieModel(
      idCategory: json['idCategory'],
      strCategory: json['strCategory'],
      strCategoryDescription: json['strCategoryDescription'],
      strCategoryThumb: json['strCategoryThumb']);

  Map<String, dynamic> toJson() => {
        'idCategory': idCategory,
        'strCategory': strCategory,
        'strCategoryDescription': strCategoryDescription,
        'strCategoryThumb': strCategoryThumb
      };
}
