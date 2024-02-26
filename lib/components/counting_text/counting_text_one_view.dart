import 'package:flutter/material.dart';

class CountingTextOneView extends StatefulWidget {
  const CountingTextOneView({Key? key}) : super(key: key);

  @override
  State<CountingTextOneView> createState() => _CountingTextOneViewState();
}

class _CountingTextOneViewState extends State<CountingTextOneView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CountingText(
              begin: 0,
              end: 1000,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),
            CountingText(
              begin: 0,
              end: 100000,
              duration: const Duration(seconds: 2),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class CountingText extends StatefulWidget {
  const CountingText({
    Key? key,
    required this.begin,
    required this.end,
    this.precision = 0,
    this.curve = Curves.decelerate,
    this.duration = const Duration(milliseconds: 400),
    this.style,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
  }) : super(key: key);

  final double begin;
  final double end;
  final int precision;
  final Curve curve;
  final Duration duration;

  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;

  @override
  CountingTextState createState() => CountingTextState();
}

class CountingTextState extends State<CountingText> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    CurvedAnimation curvedAnimation = CurvedAnimation(parent: _controller, curve: widget.curve);
    _animation = Tween<double>(begin: widget.begin, end: widget.end).animate(curvedAnimation);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Text(
          _animation.value.toInt().toString(),
          style: widget.style,
          textAlign: widget.textAlign,
          textDirection: widget.textDirection,
          locale: widget.locale,
          softWrap: widget.softWrap,
          overflow: widget.overflow,
          textScaleFactor: widget.textScaleFactor,
          maxLines: widget.maxLines,
          semanticsLabel: widget.semanticsLabel,
        );
      },
    );
  }
}
