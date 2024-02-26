import 'dart:async';
import 'package:flutter/material.dart';



class Marquee extends StatefulWidget {
  const Marquee({
    Key? key,
    required this.children,
    this.offset = 40.0,
    this.maxHeight = 40.0,
  })  : itemBuilder = null,
        itemCount = children.length,
        super(key: key);

  const Marquee.builder({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
    this.offset = 40.0,
    this.maxHeight = 40.0,
  })  : children = const [],
        super(key: key);

  final List<Widget> children;
  final double offset;
  final double maxHeight;
  final NullableIndexedWidgetBuilder? itemBuilder;
  final int? itemCount;

  @override
  State<Marquee> createState() => _MarqueeState();
}

class _MarqueeState extends State<Marquee> {
  final ScrollController _scrollController = ScrollController();
  late Timer _scrollTimer;
  bool _isScrolling = true;

  @override
  void initState() {
    super.initState();

    startContinuousScroll();
  }

  void startContinuousScroll() {
    const scrollDuration = Duration(seconds: 2);
    _scrollTimer = Timer.periodic(scrollDuration, (timer) {
      if (_scrollController.hasClients && _isScrolling) {
        double newScrollOffset = _scrollController.offset + widget.offset;
        _scrollController.animateTo(
          newScrollOffset,
          duration: scrollDuration,
          curve: Curves.linear,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.maxHeight,
      child: GestureDetector(
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            final indexes = index % (widget.itemCount ?? 1);

            return GestureDetector(
              onTapDown: (_) {
                _isScrolling = false;
                _scrollTimer.cancel();
              },
              onTapUp: (_) {
                _isScrolling = true;
                startContinuousScroll();
              },
              child: widget.itemBuilder != null
                  ? widget.itemBuilder!(context, indexes)
                  : widget.children[indexes],
            );
          },
        ),
      ),
    );
  }
}

final sampleData = [
  {"val": "72,779.04", "change": 352.4, "perc": 0.49, "title": "SENSEX"},
  {"val": "22,161.20", "change": 120.5, "perc": 0.55, "title": "NIFTY 50"},
  {"val": "49,456.40", "change": 324.45, "perc": 0.66, "title": "NIFTY Midcap 100"},
  {"val": "16,294.30", "change": 100.3, "perc": 0.62, "title": "NIFTY Smallcap 100"},
  {"val": "58,832.70", "change": 246.55, "perc": 0.42, "title": "NIFTY NEXT 50"},
  {"val": "20,281.60", "change": 116.7, "perc": 0.58, "title": "NIFTY 500"},
  {"val": "47,194.98", "change": 202.12, "perc": 0.43, "title": "BSE Auto"},
  {"val": "14,011.35", "change": 85.31, "perc": 0.61, "title": "BSE IPO"},
  {"val": "52,893.54", "change": 265.25, "perc": 0.5, "title": "BSE BANKEX"},
  {"val": "51,375.74", "change": 943.26, "perc": 1.87, "title": "BSE Cons Durables"},
  {"val": "55,863.65", "change": 135.72, "perc": 0.24, "title": "BSE CAP GOODS"},
  {"val": "27,744.64", "change": 123.41, "perc": 0.45, "title": "BSE Metal"},
  {"val": "29,247.95", "change": 333.06, "perc": 1.15, "title": "BSE Oil & Gas"},
  {"val": "19,009.44", "change": 167.35, "perc": 0.89, "title": "BSE PSU"},
  {"val": "6,906.82", "change": 64.37, "perc": 0.92, "title": "BSE REALTY"},
  {"val": "17,166.63", "change": 6.75, "perc": 0.04, "title": "BSE TECk"},
  {"val": "23,088.84", "change": 108.16, "perc": 0.47, "title": "BSE 100"},
  {"val": "10,032.57", "change": 53.88, "perc": 0.54, "title": "BSE 200"},
  {"val": "32,063.05", "change": 182.1, "perc": 0.57, "title": "BSE 500"},
  {"val": "6,592.79", "change": 73.53, "perc": 1.13, "title": "BSE POWER"},
  {"val": "14,076.75", "change": 41.3, "perc": 0.29, "title": "NIFTY MIDCAP 50"},
  {"val": "22,662.75", "change": 121.85, "perc": 0.54, "title": "NIFTY 100"},
  {"val": "46,635.70", "change": 250.85, "perc": 0.54, "title": "NIFTY BANK"},
  {"val": "38,396.50", "change": 80.55, "perc": 0.21, "title": "NIFTY IT"},
  {"val": "874.80", "change": 7.9, "perc": 0.89, "title": "NIFTY REALTY"},
  {"val": "8,127.45", "change": 49.7, "perc": 0.62, "title": "NIFTY INFRA"},
  {"val": "40,109.50", "change": 427.1, "perc": 1.08, "title": "NIFTY ENERGY"},
  {"val": "54,004.75", "change": 486.15, "perc": 0.91, "title": "NIFTY FMCG"},
  {"val": "24,998.95", "change": 179.15, "perc": 0.72, "title": "NIFTY MNC"},
  {"val": "19,030.50", "change": 159.7, "perc": 0.85, "title": "NIFTY PHARMA"},
  {"val": "9,509.15", "change": 85.05, "perc": 0.9, "title": "NIFTY PSE"},
  {"val": "7,138.35", "change": 3.35, "perc": 0.05, "title": "NIFTY PSU BANK"},
  {"val": "27,938.60", "change": 129.05, "perc": 0.46, "title": "NIFTY SERV SECTOR"},
  {"val": "2,176.95", "change": 12.15, "perc": 0.56, "title": "NIFTY MEDIA"},
  {"val": "8,029.35", "change": 52.9, "perc": 0.66, "title": "NIFTY METAL"},
  {"val": "20,506.50", "change": 83.05, "perc": 0.41, "title": "NIFTY AUTO"},
  {"val": "16.09", "change": 0.87, "perc": 5.72, "title": "India VIX"},
  {"val": "22,416.25", "change": 74.7, "perc": 0.33, "title": "Nifty FinSrv25/50"},
  {"val": "25,817.40", "change": 216.2, "perc": 0.84, "title": "NIFTY AlphaLowVol 30"},
  {"val": "30,595.70", "change": 80.5, "perc": 0.26, "title": "Nifty200 Momentum 30"},
  {"val": "32,018.35", "change": 580.5, "perc": 1.85, "title": "Nifty Consr Durbl"},
  {"val": "12,109.20", "change": 70.15, "perc": 0.58, "title": "Nifty Healthcare"},
  {"val": "14,016.60", "change": 21.9, "perc": 0.16, "title": "Nifty LargeMid250"},
  {"val": "14,064.15", "change": 84.9, "perc": 0.61, "title": "Nifty500 Mul50:25:25"},
  {"val": "11,990.90", "change": 136.8, "perc": 1.15, "title": "Nifty OilGas"},
  {"val": "15,194.60", "change": 95.7, "perc": 0.63, "title": "NIFTY SMLCAP 250"},
  {"val": "17,167.50", "change": 116.45, "perc": 0.68, "title": "NIFTY MIDSML 400"},
  {"val": "3,658.07", "change": 43.75, "perc": 1.21, "title": "S&P BSE CPSE"},
  {"val": "9,515.48", "change": 52.24, "perc": 0.55, "title": "BSE 250 LARGEMIDCAP"},
  {"val": "5,919.10", "change": 64.4, "perc": 1.1, "title": "NIFTY CPSE"},
  {"val": "11,050.75", "change": 29.45, "perc": 0.27, "title": "NIFTY MID SELECT"},
  {"val": "7,762.15", "change": 67.3, "perc": 0.87, "title": "NIFTY IND DIGITAL"},
  {"val": "21,069.95", "change": 146, "perc": 0.7, "title": "NIFTY M150 QLTY50"},
  {"val": "11,764.30", "change": 66.15, "perc": 0.57, "title": "NIFTY INDIA MFG"},
  {"val": "1,394.49", "change": 19.01, "perc": 1.38, "title": "BSE Services"}
];
