import 'package:flutter/material.dart';
import 'package:housing_app/view/pages/favorite_page.dart';
import 'package:housing_app/view/pages/profile_page.dart';
import 'package:housing_app/view/pages/search_page.dart';
import 'package:proste_indexed_stack/proste_indexed_stack.dart';

import '../style/style.dart';
import 'chat_page.dart';
import 'home/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<IndexedStackChild> listOfPage = [
    IndexedStackChild(child: const HomePage()),
    IndexedStackChild(child: const SearchPage()),
    IndexedStackChild(child:  const FavoritePage()),
    IndexedStackChild(child: const ChatPage()),
    IndexedStackChild(child: const ProfilePage())
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProsteIndexedStack(
        index: index,
        children: listOfPage,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            border: Border.all(color: Style.borderBottomNav)),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (e) {
              index = e;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  label: "",
                  icon: Container(
                    width: 48,
                    height: 40,
                    margin: const EdgeInsets.only(top: 20),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                        gradient: index == 0
                            ? Style.selectedGradientBottomNav
                            : Style.unselectedGradientBottomNav,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child: Icon(
                      index == 0 ? Icons.home : Icons.home_outlined,
                      color: index == 0
                          ? Style.whiteColor
                          : Style.unselectedBottomIcon,
                    )),
                  )),
              BottomNavigationBarItem(
                  label: "",
                  icon: Container(
                    width: 48,
                    height: 40,
                    margin: const EdgeInsets.only(top: 20),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                        gradient: index == 1
                            ? Style.selectedGradientBottomNav
                            : Style.unselectedGradientBottomNav,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child: Icon(
                      Icons.search,
                      color: index == 1
                          ? Style.whiteColor
                          : Style.unselectedBottomIcon,
                    )),
                  )),
              BottomNavigationBarItem(
                  label: "",
                  icon: Container(
                    width: 48,
                    height: 40,
                    margin: const EdgeInsets.only(top: 20),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                        gradient: index == 2
                            ? Style.selectedGradientBottomNav
                            : Style.unselectedGradientBottomNav,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child: Icon(
                      index == 2 ? Icons.favorite : Icons.favorite_border,
                      color: index == 2
                          ? Style.whiteColor
                          : Style.unselectedBottomIcon,
                    )),
                  )),
              BottomNavigationBarItem(
                  label: "",
                  icon: Container(
                    width: 48,
                    height: 40,
                    margin: const EdgeInsets.only(top: 20),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                        gradient: index == 3
                            ? Style.selectedGradientBottomNav
                            : Style.unselectedGradientBottomNav,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child: Icon(
                      index == 3 ? Icons.messenger : Icons.messenger_outline,
                      color: index == 3
                          ? Style.whiteColor
                          : Style.unselectedBottomIcon,
                    )),
                  )),
              BottomNavigationBarItem(
                  label: "",
                  icon: Container(
                    width: 48,
                    height: 40,
                    margin: const EdgeInsets.only(top: 20),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                        gradient: index == 4
                            ? Style.selectedGradientBottomNav
                            : Style.unselectedGradientBottomNav,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child: Icon(
                      index == 4 ? Icons.person : Icons.person_outline,
                      color: index == 4
                          ? Style.whiteColor
                          : Style.unselectedBottomIcon,
                    )),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
