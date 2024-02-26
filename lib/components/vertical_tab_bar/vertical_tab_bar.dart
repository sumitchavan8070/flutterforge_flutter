import 'package:flutter/material.dart';

enum IndicatorSide { start, end }

PageController controller = PageController(viewportFraction: 1, keepPage: true);

class VerticalTabs extends StatefulWidget {
  final int initialIndex;
  final double tabsWidth;
  final double indicatorWidth;
  final IndicatorSide indicatorSide;
  final List<Tab> tabs;
  final List<Widget> contents;
  final TextDirection direction;
  final Color indicatorColor;
  final bool disabledChangePageFromContentView;
  final Axis contentScrollAxis;
  final Color selectedTabBackgroundColor;
  final Color tabBackgroundColor;
  final TextStyle selectedTabTextStyle;
  final TextStyle tabTextStyle;
  final Duration changePageDuration;
  final Curve changePageCurve;
  final Color tabsShadowColor;
  final double tabsElevation;
  final Function(int tabIndex)? onSelect;
  final Color? backgroundColor;

  const VerticalTabs({
    Key? key,
    required this.tabs,
    required this.contents,
    this.tabsWidth = 200,
    this.indicatorWidth = 3,
    this.indicatorSide = IndicatorSide.start,
    this.initialIndex = 0,
    this.direction = TextDirection.ltr,
    this.indicatorColor = const Color(0xff1A51AA),
    this.disabledChangePageFromContentView = false,
    this.contentScrollAxis = Axis.horizontal,
    this.selectedTabBackgroundColor = const Color(0xFFD9E7FF),
    this.tabBackgroundColor = const Color(0xfff8f8f8),
    this.selectedTabTextStyle = const TextStyle(color: Colors.black),
    this.tabTextStyle = const TextStyle(color: Colors.black38),
    this.changePageCurve = Curves.easeInOut,
    this.changePageDuration = const Duration(milliseconds: 300),
    this.tabsShadowColor = Colors.black54,
    this.tabsElevation = 2.0,
    this.onSelect,
    this.backgroundColor,
  })  : assert(tabs.length == contents.length),
        super(key: key);

  @override
  VerticalTabsState createState() => VerticalTabsState();
}

class VerticalTabsState extends State<VerticalTabs> with TickerProviderStateMixin {
  late int _selectedIndex;
  bool? _changePageByTapView;

  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<RelativeRect> rectAnimation;

  PageController pageController = PageController();

  List<AnimationController> animationControllers = [];

  ScrollPhysics pageScrollPhysics = const AlwaysScrollableScrollPhysics();

  @override
  void initState() {
    _selectedIndex = widget.initialIndex;
    for (int i = 0; i < widget.tabs.length; i++) {
      animationControllers.add(AnimationController(
        duration: const Duration(milliseconds: 600),
        vsync: this,
      ));
    }
    _selectTab(widget.initialIndex);

    if (widget.disabledChangePageFromContentView == true) {
      pageScrollPhysics = const NeverScrollableScrollPhysics();
    }

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pageController.jumpToPage(widget.initialIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: widget.direction,
      child: Container(
        color: widget.backgroundColor ?? Theme.of(context).canvasColor,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Material(
                    elevation: widget.tabsElevation,
                    shadowColor: widget.tabsShadowColor,
                    shape: const BeveledRectangleBorder(),
                    child: SizedBox(
                      width: widget.tabsWidth,
                      child: ListView.separated(
                        itemCount: widget.tabs.length,
                        itemBuilder: (context, index) {
                          Tab tab = widget.tabs[index];

                          Alignment alignment = Alignment.centerLeft;
                          if (widget.direction == TextDirection.rtl) {
                            alignment = Alignment.centerRight;
                          }

                          Widget child;
                          if (tab.child != null) {
                            child = tab.child!;
                          } else {
                            child = Container(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: <Widget>[
                                  (tab.icon != null)
                                      ? Row(
                                    children: <Widget>[
                                      tab.icon!,
                                      const SizedBox(
                                        width: 5,
                                      )
                                    ],
                                  )
                                      : Container(),
                                  (tab.text != null)
                                      ? SizedBox(
                                    width: widget.tabsWidth - 50,
                                    child: Text(
                                      tab.text!,
                                      softWrap: true,
                                      style: _selectedIndex == index
                                          ? widget.selectedTabTextStyle
                                          : widget.tabTextStyle,
                                    ),
                                  )
                                      : Container(),
                                ],
                              ),
                            );
                          }

                          Color itemBGColor = widget.tabBackgroundColor;
                          if (_selectedIndex == index) {
                            itemBGColor = widget.selectedTabBackgroundColor;
                          }

                          double? left, right;
                          if (widget.direction == TextDirection.rtl) {
                            left = ((widget.indicatorSide == IndicatorSide.end) ? 0 : null);
                            right = ((widget.indicatorSide == IndicatorSide.start) ? 0 : null);
                          } else {
                            right = ((widget.indicatorSide == IndicatorSide.end) ? 0 : null);
                            left = ((widget.indicatorSide == IndicatorSide.start) ? 0 : null);
                          }

                          return Stack(
                            children: <Widget>[

                              GestureDetector(
                                onTap: () {
                                  _changePageByTapView = true;
                                  setState(() {
                                    _selectTab(index);
                                  });

                                  pageController.animateToPage(index,
                                      duration: widget.changePageDuration,
                                      curve: widget.changePageCurve);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: itemBGColor,
                                  ),
                                  alignment: alignment,
                                  padding: const EdgeInsets.all(5),
                                  child: Row(
                                    children: [child],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 2,
                                bottom: 2,
                                width: widget.indicatorWidth,
                                left: left,
                                right: right,
                                child: ScaleTransition(
                                  scale: Tween(begin: 0.0, end: 1.0).animate(
                                    CurvedAnimation(
                                      parent: animationControllers[index],
                                      curve: Curves.decelerate,
                                    ),
                                  ),
                                  child: Container(
                                    color: widget.indicatorColor,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const VerticalDivider();
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      clipBehavior: Clip.hardEdge,
                      scrollDirection: widget.contentScrollAxis,
                      itemCount: widget.contents.length,
                      physics: pageScrollPhysics,
                      controller: pageController,
                      onPageChanged: (index) {
                        if (_changePageByTapView == false || _changePageByTapView == null) {
                          _selectTab(index);
                        }
                        if (_selectedIndex == index) {
                          _changePageByTapView = null;
                        }
                        setState(() {});
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: widget.contents[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectTab(index) {
    _selectedIndex = index;
    for (AnimationController animationController in animationControllers) {
      animationController.reset();
    }
    animationControllers[index].forward();

    if (widget.onSelect != null) {
      widget.onSelect!(_selectedIndex);
    }
  }
}
