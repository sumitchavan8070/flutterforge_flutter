import 'package:flutter/material.dart';

class TabBarTwo extends StatelessWidget {
  final List<String> tabs;
  final bool isScrollable;
  final double height;
  final TabController? tabController;
  final double borderRadius;

  const TabBarTwo({
    Key? key,
    required this.tabs,
    this.isScrollable = false,
    this.height = 45,
    this.tabController,
    this.borderRadius = 32,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: TabBar(
            dividerColor: Colors.transparent,
            isScrollable: isScrollable,
            unselectedLabelColor: Colors.black,
            labelColor: Colors.white,
            indicatorColor: const Color(0xff1A51AA),
            indicatorSize: TabBarIndicatorSize.tab,
            padding: const EdgeInsets.all(6),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color:  const Color(0xff1A51AA),
            ),
            controller: tabController,
            tabs: List.generate(
              tabs.length,
              (index) => Tab(
                child: Text(
                  tabs[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
