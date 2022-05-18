import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:project_alta/Data_API/kategori_data.dart';
import 'package:project_alta/Model/katgori_model.dart';
import 'kategori_data_test.mocks.dart';

@GenerateMocks([CategorieData])
void main() {
  CategorieData categorieData = MockCategorieData();
  testWidgets('kategori data ...', (tester) async {
    when(categorieData.getcategories())
        .thenAnswer((_) async => <CategorieModel>[
              CategorieModel(
                  idCategory: "idCategory",
                  strCategory: "strCategory",
                  strCategoryDescription: "strCategoryDescription",
                  strCategoryThumb: "strCategoryThumb")
            ]);
    var categoriesData = await categorieData.getcategories();
    expect(categoriesData.isNotEmpty, true);
  });
}
