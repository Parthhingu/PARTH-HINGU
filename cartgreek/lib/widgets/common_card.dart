import 'package:cartgreek/constants/themes.dart';
import 'package:flutter/material.dart';

class CardView extends StatefulWidget {
  final Color? color;
  final double radius;
  final Widget? child;
  final Color? borderColor;

  const CardView(
      {Key? key, this.color, this.radius = 16, this.child, this.borderColor})
      : super(key: key);
  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      //   shadowColor: Theme.of(context).dividerColor,
      elevation: 0,
      color: widget.color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          side: BorderSide(
              color: widget.borderColor ??
                  AppTheme.primaryTextColor.withOpacity(0.2))),
      child: widget.child,
    );
  }
}
