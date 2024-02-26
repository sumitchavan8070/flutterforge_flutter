import 'package:flutter/material.dart';

class TabBarOne extends StatelessWidget {
  const TabBarOne({
    super.key,
    required this.tabs,
    this.isScrollable = true,
    this.controller,
  });

  final List<String> tabs;
  final bool isScrollable;
  final TabController? controller;
  @override
  Widget build(BuildContext context) {

    return TabBar(
      controller: controller,
      indicatorSize: TabBarIndicatorSize.tab,
      physics: const BouncingScrollPhysics(),
      isScrollable: isScrollable,
      indicatorColor: const Color(0xff1A51AA),
      labelColor: const Color(0xff1A51AA),
      unselectedLabelColor: Colors.black,
      tabs: List.generate(
        tabs.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: Text(
            tabs[index],
          ),
        ),
      ),
    );
  }
}
