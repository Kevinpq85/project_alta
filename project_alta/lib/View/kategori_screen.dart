import 'package:flutter/material.dart';
import 'package:project_alta/View/HomeView/home_view_model.dart';
import 'package:project_alta/View/meal_by_kategori_screen.dart';
import 'package:provider/provider.dart';

class CategorieScreen extends StatefulWidget {
  const CategorieScreen({Key? key}) : super(key: key);

  @override
  State<CategorieScreen> createState() => _CategorieScreenState();
}

class _CategorieScreenState extends State<CategorieScreen> {
  bool isInit = true;
  @override
  void didChangeDependencies() {
    if (isInit == true) {
      Provider.of<HomeViewModel>(context, listen: false).getcategories();
      isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black87),
          elevation: 0,
          titleSpacing: 0,
          title: const Text(
            'Kategori',
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView.separated(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: homeViewModel.categories.length,
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: homeViewModel.categories.isNotEmpty
                                    ? Colors.white
                                    : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10),
                                image: homeViewModel.categories.isNotEmpty
                                    ? DecorationImage(
                                        image: NetworkImage(
                                          homeViewModel.categories[index]
                                              .strCategoryThumb,
                                        ),
                                        fit: BoxFit.contain)
                                    : null,
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(1.5, 1.5),
                                    blurRadius: 1,
                                    color: Color.fromARGB(90, 0, 0, 0),
                                  )
                                ]),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          homeViewModel.categories.isNotEmpty
                              ? Text(
                                  homeViewModel.categories[index].strCategory,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                  ),
                                )
                              : Container(
                                  height: 15,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: homeViewModel.categories.isNotEmpty
                            ? TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          MealsByCategotrieScreen(
                                            categoryname: homeViewModel
                                                .categories[index].strCategory,
                                            filterType: 'Kategori',
                                          ),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        final tween = Tween(
                                            begin: const Offset(0, 5),
                                            end: Offset.zero);
                                        return SlideTransition(
                                          position: animation.drive(tween),
                                          child: child,
                                        );
                                      }));
                                },
                                child: const Text(
                                  'Lihat Makanan',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xffC3211A),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ))
                            : Container(
                                height: 15,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.grey.shade300,
                                ),
                              ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: homeViewModel.categories.isNotEmpty
                          ? Text(
                              homeViewModel
                                  .categories[index].strCategoryDescription,
                              // maxLines: 15,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ))
                          : Column(
                              children: List.generate(
                                3,
                                (index) => Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: 15,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                ),
                              ),
                            )),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey.shade200,
              ),
            );
          },
        ));
  }
}
