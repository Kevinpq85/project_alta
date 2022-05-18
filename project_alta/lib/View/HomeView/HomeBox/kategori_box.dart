import 'package:flutter/material.dart';
import 'package:project_alta/View/HomeView/home_view_model.dart';
import 'package:project_alta/View/meal_by_kategori_screen.dart';
import 'package:provider/provider.dart';

class CategorieBox extends StatefulWidget {
  const CategorieBox({
    Key? key,
    required this.boxTitle,
    required this.onPressed,
  }) : super(key: key);

  final String boxTitle;
  final VoidCallback onPressed;

  @override
  State<CategorieBox> createState() => _CategorieBoxState();
}

class _CategorieBoxState extends State<CategorieBox> {
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

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                homeViewModel.categories.isNotEmpty
                    ? Text(
                        widget.boxTitle,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      )
                    : Container(
                        height: 15,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                homeViewModel.categories.isNotEmpty
                    ? TextButton(
                        onPressed: widget.onPressed,
                        child: const Text(
                          'Lihat Semua',
                          style: TextStyle(
                            color: Color(0xffC3211A),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    : Container(
                        height: 15,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.grey.shade300,
                        ),
                      )
              ],
            ),
          ),
          SizedBox(
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 11,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MealsByCategotrieScreen(
                            categoryname:
                                homeViewModel.categories[index].strCategory,
                            filterType: 'Kategori',
                          ),
                        ));
                  },
                  child: Container(
                    width: 100,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 15, top: 5, bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 185, 47, 4),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 5,
                            color: Color.fromARGB(117, 0, 0, 0),
                          )
                        ]),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(
                                top: 3, left: 3, right: 3, bottom: 7),
                            decoration: BoxDecoration(
                              color: homeViewModel.categories.isNotEmpty
                                  ? Colors.white
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(7),
                              image: homeViewModel.categories.isNotEmpty
                                  ? DecorationImage(
                                      image: NetworkImage(
                                        homeViewModel
                                            .categories[index].strCategoryThumb,
                                      ),
                                      fit: BoxFit.contain)
                                  : null,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: homeViewModel.categories.isNotEmpty
                              ? Text(
                                  homeViewModel.categories[index].strCategory,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                  ),
                                )
                              : Container(
                                  height: 15,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
