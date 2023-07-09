import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sellproducts/modules/select_screen/view/select_view.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({super.key});

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  List<Widget> widgets = [
    const SelectView(),
  ];
  PageController pageController = PageController(initialPage: 0);
  int selectedIndex = 0;

  _onTap(int index) {
    pageController.jumpToPage(index);
    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: widgets,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: const IconThemeData(
            color: Color(0xffE96E6E),
          ),
          onTap: _onTap,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          unselectedIconTheme: const IconThemeData(color: Color(0xffC0C0C0)),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: "menu"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.heart), label: "like"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
          ],
        ),
      ),
    );
  }
}
