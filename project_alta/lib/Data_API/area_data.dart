import 'package:dio/dio.dart';

class AreaData {
  Future<List<String>> getArea() async {
    Response response = await Dio()
        .get('https://www.themealdb.com/api/json/v1/1/list.php?a=list');
    List<String> areaList = [];
    if (response.statusCode == 200) {
      for (int i = 0; i < response.data['meals'].length; i++) {
        areaList.add(response.data['meals'][i]['strArea']);
      }
    }

    return areaList;
  }
}
