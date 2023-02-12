import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/style.dart';

class SeparateTopRow extends StatefulWidget {
  String title;
  SeparateTopRow({Key? key, required this.title}) : super(key: key);

  @override
  State<SeparateTopRow> createState() => _SeparateTopRowState();
}

class _SeparateTopRowState extends State<SeparateTopRow> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        GestureDetector(
          child: const Icon(
            Icons.arrow_back,
            color: Style.primaryBlue,
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        20.horizontalSpace,
        Text(
          widget.title,
          style: Style.textStyleRegular(size: 26),
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
          child: const Icon(Icons.search, color: Style.primaryBlue),
        )
      ],
    );
  }
}
