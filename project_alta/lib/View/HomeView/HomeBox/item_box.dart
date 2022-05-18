import 'package:flutter/material.dart';
import 'package:project_alta/View/meal_by_kategori_screen.dart';

class ItemsBox extends StatelessWidget {
  const ItemsBox({
    Key? key,
    required this.bkg,
    required this.futureList,
    required this.filterType,
  }) : super(key: key);
  final String filterType;
  final Color bkg;
  final Future<List<String>> futureList;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: futureList,
      builder: (context, snapshot) {
        return ItemShape(
          filterType: filterType,
          bkg: bkg,
          areaList: snapshot.hasData ? snapshot.data! : [],
        );
      },
    );
  }
}

class ItemShape extends StatelessWidget {
  const ItemShape({
    Key? key,
    required this.bkg,
    required this.areaList,
    required this.filterType,
  }) : super(key: key);
  final Color bkg;
  final List<String> areaList;
  final String filterType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 5,
      ),
      width: double.infinity,
      height: 43,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: areaList.isNotEmpty ? areaList.length : 15,
        itemBuilder: (context, index) {
          return areaList.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MealsByCategotrieScreen(
                            categoryname: areaList[index].toString(),
                            filterType: filterType,
                          ),
                        ));
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    margin: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: bkg,
                    ),
                    child: Text(
                      areaList[index].toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              : Container(
                  height: 15,
                  width: 80,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  margin: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.grey.shade300,
                  ),
                );
        },
      ),
    );
  }
}
