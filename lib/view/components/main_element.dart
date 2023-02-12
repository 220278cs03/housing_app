import 'package:flutter/material.dart';

import '../style/style.dart';

class MainElement extends StatelessWidget {
  String name;
  String image;
  String location;
  String category;
  bool like;
  num price;
  num rate;

   MainElement(
      {Key? key,
      required this.name,
      required this.location,
      required this.category,
      required this.price,
      required this.rate,
      required this.like,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: state.listOfHome.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            width: 220,
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
                color: Style.whiteColor,
                border: Border.all(color: Style.borderCategory),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Container(
                  height: 160,
                  width: 220,
                  decoration: BoxDecoration(
                      color: Style.borderCategory,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                      image: DecorationImage(
                          image: NetworkImage(state.listOfHome[index].image),
                          fit: BoxFit.cover)),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox.shrink(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                              color: Style.whiteColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(6)),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Style.yellowColor,
                                size: 18,
                              ),
                              4.horizontalSpace,
                              Text(
                                "${state.listOfHome[index].rate}",
                                style: Style.textStyleRegular(
                                    size: 16, textColor: Style.ratingTextColor),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                                color: Style.whiteColor,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(color: Style.primaryBlue)),
                            child: Text(
                              "Apartment",
                              style: Style.textStyleRegular(
                                  size: 11, textColor: Style.primaryBlue),
                            ),
                          ),
                          const Spacer(),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "\$${state.listOfHome[index].price}",
                                style: Style.textStyleRegular(
                                    size: 18, textColor: Style.primaryBlue)),
                            TextSpan(
                                text: " /month",
                                style: Style.textStyleThin(
                                    size: 11, textColor: Style.monthColor))
                          ]))
                        ],
                      ),
                      9.verticalSpace,
                      Text(
                        state.listOfHome[index].name,
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
                            state.listOfHome[index].location,
                            style: Style.textStyleThin(size: 11),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.favorite_border,
                            color: Style.primaryBlue,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
