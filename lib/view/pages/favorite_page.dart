import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../controller/home_controller.dart';
import '../components/fav_categories.dart';
import '../components/favorite_top_row.dart';
import '../components/main_element.dart';
import '../style/style.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeController>().getAllLiked();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final event = context.read<HomeController>();
    final state = context.watch<HomeController>();
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 39, left: 24, right: 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const FavoriteTopRow(),
        26.verticalSpace,
        const FavCategories(),
         (state.isCategorySet ? state.listOfLikedByCategory.isEmpty : state.listOfLiked.isEmpty)
            ?  state.isLikedLoading
             ? const Padding(
           padding: EdgeInsets.only(top: 120),
           child: Center(
             child: CircularProgressIndicator(
               color: Style.primaryBlue,
             ),
           ),
         ) : Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                          height: 280,
                          width: 290,
                          child: Image.asset(
                            "assets/image/not_favorite.png",
                            fit: BoxFit.cover,
                          )),
                      24.verticalSpace,
                      Text(
                        "You don't have a favorite",
                        style: Style.textStyleRegular(
                            size: 26, textColor: Style.primaryBlue),
                      )
                    ],
                  ),
                ),
              )

                : Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.only(top: 24),
                        itemCount: state.isCategorySet
                            ? state.listOfLikedByCategory.length
                            : state.listOfLiked.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(bottom: 24),
                            decoration: BoxDecoration(
                                color: Style.whiteColor,
                                border: Border.all(color: Style.borderCategory),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Container(
                                  height: 160,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Style.borderCategory,
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          topLeft: Radius.circular(20)),
                                      image: DecorationImage(
                                          image: NetworkImage(state
                                                  .isCategorySet
                                              ? state
                                                  .listOfLikedByCategory[index]
                                                  .image
                                              : state.listOfLiked[index].image),
                                          fit: BoxFit.cover)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox.shrink(),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                              color: Style.whiteColor
                                                  .withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Style.yellowColor,
                                                size: 18,
                                              ),
                                              4.horizontalSpace,
                                              Text(
                                                state.isCategorySet
                                                    ? "${state.listOfLikedByCategory[index].rate}"
                                                    : "${state.listOfLiked[index].rate}",
                                                style: Style.textStyleRegular(
                                                    size: 16,
                                                    textColor:
                                                        Style.ratingTextColor),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                            decoration: BoxDecoration(
                                                color: Style.whiteColor,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                border: Border.all(
                                                    color: Style.primaryBlue)),
                                            child: Text(
                                              state.isCategorySet
                                                  ? state
                                                      .listOfLikedByCategory[
                                                          index]
                                                      .category
                                                  : state.listOfLiked[index]
                                                      .category,
                                              style: Style.textStyleRegular(
                                                  size: 11,
                                                  textColor: Style.primaryBlue),
                                            ),
                                          ),
                                          const Spacer(),
                                          RichText(
                                              text: TextSpan(children: [
                                            TextSpan(
                                                text: state.isCategorySet
                                                    ? "${state.listOfLikedByCategory[index].price}"
                                                    : "${state.listOfLiked[index].price}",
                                                style: Style.textStyleRegular(
                                                    size: 18,
                                                    textColor:
                                                        Style.primaryBlue)),
                                            TextSpan(
                                                text: " /month",
                                                style: Style.textStyleThin(
                                                    size: 11,
                                                    textColor:
                                                        Style.monthColor))
                                          ]))
                                        ],
                                      ),
                                      9.verticalSpace,
                                      Text(
                                        state.isCategorySet
                                            ? state.listOfLikedByCategory[index]
                                                .name
                                            : state.listOfLiked[index].name,
                                        style: Style.textStyleRegular(size: 18),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            color: Style.primaryBlue,
                                          ),
                                          4.horizontalSpace,
                                          Text(
                                            state.isCategorySet
                                                ? state
                                                    .listOfLikedByCategory[
                                                        index]
                                                    .location
                                                : state.listOfLiked[index]
                                                    .location,
                                            style:
                                                Style.textStyleThin(size: 11),
                                          ),
                                          const Spacer(),
                                          GestureDetector(
                                            child: const Icon(
                                              Icons.favorite,
                                              color: Style.primaryBlue,
                                            ),
                                            onTap: () {
                                              showModalBottomSheet(
                                                  backgroundColor:
                                                      Style.transparentColor,
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.75,
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 24,
                                                              right: 24,
                                                              top: 48),
                                                      decoration: const BoxDecoration(
                                                          color:
                                                              Style.whiteColor,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          40),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          40))),
                                                      child: Column(children: [
                                                        MainElement(
                                                          name: state
                                                                  .isCategorySet
                                                              ? state
                                                                  .listOfLikedByCategory[
                                                                      index]
                                                                  .name
                                                              : state
                                                                  .listOfLiked[
                                                                      index]
                                                                  .name,
                                                          location: state
                                                                  .isCategorySet
                                                              ? state
                                                                  .listOfLikedByCategory[
                                                                      index]
                                                                  .location
                                                              : state
                                                                  .listOfLiked[
                                                                      index]
                                                                  .location,
                                                          category: state
                                                                  .isCategorySet
                                                              ? state
                                                                  .listOfLikedByCategory[
                                                                      index]
                                                                  .category
                                                              : state
                                                                  .listOfLiked[
                                                                      index]
                                                                  .category,
                                                          price: state
                                                                  .isCategorySet
                                                              ? state
                                                                  .listOfLikedByCategory[
                                                                      index]
                                                                  .price
                                                              : state
                                                                  .listOfLiked[
                                                                      index]
                                                                  .price,
                                                          rate: state
                                                                  .isCategorySet
                                                              ? state
                                                                  .listOfLikedByCategory[
                                                                      index]
                                                                  .rate
                                                              : state
                                                                  .listOfLiked[
                                                                      index]
                                                                  .rate,
                                                          like: true,
                                                          image: state
                                                                  .isCategorySet
                                                              ? state
                                                                  .listOfLikedByCategory[
                                                                      index]
                                                                  .image
                                                              : state
                                                                  .listOfLiked[
                                                                      index]
                                                                  .image,
                                                        ),
                                                        Text(
                                                          "Remove from favorite?",
                                                          style: Style
                                                              .textStyleRegular(
                                                                  size: 16,
                                                                  textColor: Style
                                                                      .titleTextColor),
                                                        ),
                                                        16.verticalSpace,
                                                        Row(
                                                          children: [
                                                            GestureDetector(
                                                              child: Container(
                                                                width: (MediaQuery.of(context)
                                                                            .size
                                                                            .width -
                                                                        56) /
                                                                    2,
                                                                height: 55,
                                                                decoration: BoxDecoration(
                                                                    color: Style
                                                                        .whiteColor,
                                                                    border: Border.all(
                                                                        color: Style
                                                                            .primaryBlue),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            32)),
                                                                child: Center(
                                                                    child: Text(
                                                                  "Cancel",
                                                                  style: Style.textStyleRegular(
                                                                      size: 18,
                                                                      textColor:
                                                                          Style
                                                                              .primaryBlue),
                                                                )),
                                                              ),
                                                              onTap: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                            8.horizontalSpace,
                                                            GestureDetector(
                                                              child: Container(
                                                                width: (MediaQuery.of(context)
                                                                            .size
                                                                            .width -
                                                                        56) /
                                                                    2,
                                                                height: 55,
                                                                decoration: BoxDecoration(
                                                                    gradient: Style
                                                                        .selectedGradientBottomNav,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            32)),
                                                                child: Center(
                                                                    child: Text(
                                                                  "Yes, Remove",
                                                                  style: Style.textStyleRegular(
                                                                      size: 18,
                                                                      textColor:
                                                                          Style
                                                                              .whiteColor),
                                                                )),
                                                              ),
                                                              onTap: () {
                                                                event
                                                                    .deleteLike(
                                                                        index);
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            )
                                                          ],
                                                        )
                                                      ]),
                                                    );
                                                  });
                                            },
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  )
      ]),
    ));
  }
}
