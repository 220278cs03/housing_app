import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:housing_app/controller/home_controller.dart';
import 'package:provider/provider.dart';

import '../style/style.dart';

class MainElement extends StatelessWidget {
  String name;
  String image;
  String location;
  String category;
  bool like;
  num price;
  num rate;
  int? index;

  MainElement({
    Key? key,
    required this.name,
    required this.location,
    required this.category,
    required this.price,
    required this.rate,
    required this.like,
    required this.image,
    this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final event = context.read<HomeController>();
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
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox.shrink(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                          "$rate",
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                        category,
                        style: Style.textStyleRegular(
                            size: 11, textColor: Style.primaryBlue),
                      ),
                    ),
                    const Spacer(),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "\$$price",
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
                  name,
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
                      location,
                      style: Style.textStyleThin(size: 11),
                    ),
                    const Spacer(),
                     GestureDetector(
                       child: Icon(
                        like ? Icons.favorite : Icons.favorite_border,
                        color: Style.primaryBlue,
                    ),
                       onTap: (){
                         event.changeLike(index!);
                         print("hefkj");
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
  }
}
