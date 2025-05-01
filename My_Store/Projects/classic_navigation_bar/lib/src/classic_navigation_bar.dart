/// A library for a customizable bottom navigation bar with smooth animations.
library classic_navigation_bar;

export 'classic_navigation_bar.dart';
export 'item_navigation.dart';

import 'package:flutter/material.dart';

import 'item_navigation.dart';



class ClassicNavigationBar extends StatefulWidget{
  final Function(int) onChangePage;
  final Color? backgroundColor;
  final Color? borderTopColor;
  final Curve? curve;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final Gradient? gradient;
  final Duration? durationAnimation;
  final List<ItemNavigation> items;
  final bool? isLineTop;
  final double? lineHeight;
  const ClassicNavigationBar({
    super.key,
    required this.onChangePage,
    required this.items,
    this.durationAnimation,
    this.backgroundColor,
    this.borderRadius,
    this.gradient,
    this.color,
    this.curve,
    this.borderTopColor,
    this.isLineTop = true,
    this.lineHeight = 4,
  });

  @override
  State<ClassicNavigationBar> createState() => _ClassicNavigationBar();
}

class _ClassicNavigationBar extends State<ClassicNavigationBar> {
  final double borderRadius = 11.1;
  late int _currentPage = 0;
  final Color color = Colors.blue;
  Duration durationAnimation = const Duration(milliseconds: 250);

  @override
  void initState() {
    if (widget.durationAnimation != null) durationAnimation = widget.durationAnimation!;
    _currentPage = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: widget.backgroundColor ?? Colors.white,
      height: 55,
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 1,
            color: widget.borderTopColor ?? Colors.grey.withAlpha(20),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (p0, constraints) {
                return Stack(
                  children: [
                    AnimatedPositioned(
                      curve: widget.curve ?? Curves.easeInOutQuint,
                      left: (constraints.maxWidth / widget.items.length) * _currentPage, // Simplified for left-to-right
                      width: constraints.maxWidth / widget.items.length,
                      height: constraints.maxHeight,
                      duration: Duration(milliseconds: durationAnimation.inMilliseconds),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 40 / widget.items.length,
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: widget.borderRadius ?? BorderRadius.circular(borderRadius),
                            ),
                            child: Column(
                              children: [
                                Visibility(
                                  visible: widget.isLineTop ?? true,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: durationAnimation.inMilliseconds ~/ 2),
                                      width: double.maxFinite,
                                      height: widget.lineHeight,
                                      decoration: BoxDecoration(
                                        color: widget.color ?? color,
                                        borderRadius: widget.borderRadius ??
                                            const BorderRadius.only(
                                              topLeft: Radius.circular(4),
                                              topRight: Radius.circular(4),
                                              bottomLeft: Radius.circular(0),
                                              bottomRight: Radius.circular(0),
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: AnimatedContainer(
                                      duration: Duration(microseconds: durationAnimation.inMilliseconds ~/ 2.1),
                                      decoration: BoxDecoration(
                                        gradient: widget.gradient ??
                                            LinearGradient(
                                              colors: [
                                                Colors.white.withAlpha(0),
                                                (widget.color ?? color).withValues(alpha: 0.2),
                                              ],
                                              begin: const FractionalOffset(0.0, 0.0),
                                              end: const FractionalOffset(0.0, 1.0),
                                              stops: const [0.0, 1.0],
                                              tileMode: TileMode.mirror,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: !(widget.isLineTop ?? true),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: durationAnimation.inMilliseconds ~/ 2),
                                      width: double.maxFinite,
                                      height: widget.lineHeight,
                                      decoration: BoxDecoration(
                                        color: widget.color ?? color,
                                        borderRadius: widget.borderRadius ??
                                            const BorderRadius.only(
                                              topLeft: Radius.circular(4),
                                              topRight: Radius.circular(4),
                                              bottomLeft: Radius.circular(0),
                                              bottomRight: Radius.circular(0),
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      child: Row(
                        children: widget.items.asMap().entries.map((entry) {
                          int index = entry.key;
                          ItemNavigation item = entry.value;
                          return Flexible(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _currentPage = index;
                                  widget.onChangePage.call(index);
                                });
                              },
                              child: LayoutBuilder(
                                builder: (BuildContext context, BoxConstraints constraints) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: AnimatedCrossFade(
                                          firstChild: item.childBefore,
                                          secondChild: item.childAfter,
                                          crossFadeState: (_currentPage == index)
                                              ? CrossFadeState.showSecond
                                              : CrossFadeState.showFirst,
                                          duration: Duration(milliseconds: durationAnimation.inMilliseconds ~/ 2),
                                        ),
                                      ),
                                      AnimatedCrossFade(
                                        firstChild: Text(
                                          item.label,
                                          style: TextStyle(
                                            color: Colors.black.withValues(alpha: 0.7),
                                            fontSize: 12,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        secondChild: Text(
                                          item.label,
                                          style: TextStyle(
                                            color: widget.color ?? color,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        crossFadeState: (_currentPage == index)
                                            ? CrossFadeState.showSecond
                                            : CrossFadeState.showFirst,
                                        duration: Duration(milliseconds: durationAnimation.inMilliseconds ~/ 2),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}




