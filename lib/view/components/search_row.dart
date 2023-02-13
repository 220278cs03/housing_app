import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:housing_app/view/components/unfocused_tap.dart';
import 'package:provider/provider.dart';

import '../../controller/home_controller.dart';
import '../style/style.dart';
import 'delayed.dart';

class SearchRow extends StatefulWidget {
  bool? isLikePage;
   SearchRow({Key? key, this.isLikePage = false}) : super(key: key);

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
    return OnUnFocusTap(
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              onChanged: (s) {
                _delayed.run(() async {
               //widget.isLikePage ?? false ? event.searchLike(s) :
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
                  suffixIcon: GestureDetector(
                    child: const Icon(
                      Icons.clear,
                      color: Style.searchIconColor,
                    ),
                    onTap: (){
                      controller.clear();
                      event.getProduct();
                    },
                  ),
              ),
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
            child: GestureDetector(child: const Icon(Icons.search, color: Style.primaryBlue), onTap: (){
              event.disableSearch();
            },),
          )
        ],
      ),
    );
  }
}
