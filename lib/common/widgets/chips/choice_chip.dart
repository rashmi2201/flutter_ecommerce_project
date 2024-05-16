import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:flutter_ecommerce_project/utlis/constants/colors.dart';
import 'package:flutter_ecommerce_project/utlis/helpers/helper_functions.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip(
      {super.key, required this.text, required this.selected, this.onSelected});

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final dark = THelperfunctions.isDarkMode(context);
    final isColor = THelperfunctions.getColor(text) != null;
    return ChoiceChip(
      label: isColor
          ? const SizedBox()
          : Text(
              text,
              style: TextStyle(color: dark ? TColors.white : TColors.black),
            ),

      selected: selected,

      onSelected: onSelected,
      // ignore: dead_code
      labelStyle: const TextStyle(color: true ? TColors.white : null),
      avatar: isColor
          ? TCircularContainer(
              width: 50,
              height: 50,
              backgroundColor: THelperfunctions.getColor(text)!)
          : null,

      labelPadding: isColor ? const EdgeInsets.all(0) : null,

      // making icon in the centre
      padding: isColor ? const EdgeInsets.all(0) : null,

      backgroundColor: isColor ? THelperfunctions.getColor(text)! : null,
      shape: isColor ? const CircleBorder() : null,
    );
  }
}