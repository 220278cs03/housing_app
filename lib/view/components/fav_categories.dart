import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/home_controller.dart';
import '../style/style.dart';

class FavCategories extends StatefulWidget {
  const FavCategories({Key? key}) : super(key: key);

  @override
  State<FavCategories> createState() => _FavCategoriesState();
}

class _FavCategoriesState extends State<FavCategories> {
  List listOfCategoryName = ["All", "House", "Villa", "Apartment"];

  @override
  Widget build(BuildContext context) {
    final event = context.read<HomeController>();
    final state = context.watch<HomeController>();
    return SizedBox(
      height: 36,
      child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Style.primaryBlue),
                    color: index == state.selectedIndex
                        ? Style.primaryBlue
                        : Style.whiteColor),
                child: Text(
                  listOfCategoryName[index],
                  style: Style.textStyleRegular(
                      size: 16,
                      textColor: index == state.selectedIndex
                          ? Style.whiteColor
                          : Style.primaryBlue),
                ),
              ),
              onTap: () {
                 event.changeIndex(index);
                 event.getLikedByCategory(listOfCategoryName[index]);
              },
            );
          }),
    );
  }
}
