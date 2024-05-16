import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_project/utlis/constants/colors.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.showBorder = false,
    this.radius = Tsized.cardRadiusLg,
    this.backgroundColor,
    this.borderColor = TColors.borderPrimary,
  });

  final double? width;

  final double? height;
  final double radius;

  final Widget? child;

  final bool showBorder;

  final Color borderColor;

  final Color? backgroundColor;

  final EdgeInsetsGeometry? padding;

  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,

      height: height,

      padding: padding,

      margin: margin,

      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child, // BoxDecoration
    );
  }
} // Container