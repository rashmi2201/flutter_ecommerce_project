import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/brands/t_brand_title_text.dart';
import 'package:flutter_ecommerce_project/utlis/constants/colors.dart';
import 'package:flutter_ecommerce_project/utlis/constants/enums.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class TBrandTitleWithVerifiedIcon extends StatelessWidget {
  const TBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = TColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextsize = Textsizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final Textsizes brandTextsize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: TBrandTitleText(
          title: title,
          maxLines: maxLines,
          textAlign: textAlign,
          brandTextsize: brandTextsize,
          color: textColor,
        )),
        const SizedBox(
          width: Tsized.xs,
        ),
        const Icon(
          Iconsax.verify5,
          color: TColors.primary,
          size: Tsized.iconXs,
        )
      ],
    );
  }
}
