import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/style.dart';

class HomeTopRow extends StatelessWidget {
  const HomeTopRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Location",
                  style: Style.textStyleThin(textColor: Style.searchIconColor),
                ),
                4.horizontalSpace,
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: Style.searchIconColor,
                )
              ],
            ),
            4.verticalSpace,
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Style.primaryBlue,
                ),
                6.horizontalSpace,
                Text(
                  "Surabaya, Indonesia",
                  style: Style.textStyleRegular(size: 18),
                )
              ],
            ),
          ],
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Style.bgCategory,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                    color: Style.shadowColor,
                    offset: Offset(0, 0),
                    blurRadius: 50)
              ]),
          child: GestureDetector(
            child: const Icon(Icons.notifications, color: Style.primaryBlue),
          ),
        )
      ],
    );
  }
}
