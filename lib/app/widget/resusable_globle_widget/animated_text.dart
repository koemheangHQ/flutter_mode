import 'package:flutter/material.dart';
import 'package:fluuter_model/app/modules/profile/widget/widget.dart';

class AnimatedTextWithSeeMore extends StatefulWidget {
  const AnimatedTextWithSeeMore({
    Key? key,
    required this.text,
    this.maxLines = 2,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
  }) : super(key: key);

  final String text;
  final int maxLines;
  final Duration animationDuration;
  final Curve animationCurve;

  @override
  State<AnimatedTextWithSeeMore> createState() =>
      _AnimatedTextWithSeeMoreState();
}

class _AnimatedTextWithSeeMoreState extends State<AnimatedTextWithSeeMore> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: widget.animationDuration,
      curve: widget.animationCurve,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: AnimatedCrossFade(
                  firstChild: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          widget.text,
                          maxLines: widget.maxLines,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (!_isExpanded)
                        GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                _isExpanded = true;
                              },
                            );
                          },
                          child: AnimatedSize(
                            duration: widget.animationDuration,
                            curve: widget.animationCurve,
                            child: const Text(
                              "See more",
                              style: TextStyle(
                                  color: ColorConstant.secondaryColor),
                            ),
                          ),
                        )
                    ],
                  ),
                  secondChild: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(widget.text),
                      ),
                      if (_isExpanded)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isExpanded = false;
                            });
                          },
                          child: AnimatedSize(
                              duration: widget.animationDuration,
                              curve: widget.animationCurve,
                              child: const Text(
                                "See less",
                                style: TextStyle(
                                    color: ColorConstant.secondaryColor),
                              )),
                        ),
                    ],
                  ),
                  crossFadeState: _isExpanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: widget.animationDuration,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
