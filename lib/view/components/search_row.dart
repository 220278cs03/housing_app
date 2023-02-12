import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../controller/home_controller.dart';
import '../style/style.dart';
import 'delayed.dart';

class SearchRow extends StatefulWidget {
  const SearchRow({Key? key}) : super(key: key);

  @override
  State<SearchRow> createState() => _SearchRowState();
}

class _SearchRowState extends State<SearchRow> {
  TextEditingController controller = TextEditingController();
  final _delayed = Delayed(milliseconds: 700);

  @override
  Widget build(BuildContext context) {
    final event = context.read<HomeController>();
    //final state = context.watch<HomeController>();
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            onChanged: (s) {
              _delayed.run(() async {
                event.searchHome(s);
              });
            },
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Style.searchBgColor,
                hintText: "Search",
                hintStyle: Style.textStyleThin(),
                suffixIcon: const Icon(
                  Icons.search,
                  color: Style.searchIconColor,
                )),
          ),
        ),
        12.horizontalSpace,
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
          child: const Icon(Icons.filter_list, color: Style.primaryBlue),
        )
      ],
    );
  }
}
