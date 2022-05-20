import 'package:flutter/material.dart';
import 'package:project_alta/Data_API/area_data.dart';
import 'package:project_alta/View/HomeView/HomeBox/ads_box.dart';
import 'package:project_alta/View/HomeView/HomeBox/food_box.dart';
import 'package:project_alta/View/HomeView/HomeBox/header_box.dart';
import 'package:project_alta/View/HomeView/HomeBox/item_box.dart';
import 'package:project_alta/View/HomeView/HomeBox/kategori_box.dart';
import 'package:project_alta/View/Report/report_screen.dart';
import 'package:project_alta/View/kategori_screen.dart';
import 'package:project_alta/View/see_all_meal.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.report),
        backgroundColor: const Color.fromARGB(255, 255, 0, 0),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => const ReportScreen(judul: "Isi Laporan")));
        },
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          const HeaderBox(),
          AdsBox(reverse: false),
          CategorieBox(
            boxTitle: 'Kategori',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const CategorieScreen()));
            },
          ),
          FoodBox(
            firstChar: 'c',
            boxTitle: 'Makanan Populer',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SeeAllMeals(
                            screenTitle: 'Makanan Populer',
                            firstChar: 'c',
                          )));
            },
          ),
          ItemsBox(
            bkg: Colors.black,
            futureList: AreaData().getArea(),
            filterType: 'Area',
          ),
        ],
      ),
    );
  }
}
