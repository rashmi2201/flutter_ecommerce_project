import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/images/t_circular_image.dart';
import 'package:flutter_ecommerce_project/utlis/constants/colors.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textcolor = TColors.white,
    this.backgroundcolor = TColors.white,
    this.ontap,
    this.isNetworkImage = true,
  });
  final String image, title;
  final Color textcolor;
  final Color? backgroundcolor;
  final void Function()? ontap;
  final bool isNetworkImage;
  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkmode(context);
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(right: Tsized.spaceBtwItems),
        child: Column(
          children: [
            //circular icon

            // Container(
            //   width: 56,
            //   height: 56,
            //   padding: const EdgeInsets.all(TSizes.sm),
            //   decoration: BoxDecoration(
            //     color:
            //         backgroundcolor ,
            //         // ?? (dark ? TColors.white : TColors.white),
            //     borderRadius: BorderRadius.circular(100),
            //   ),
            //   child: Center(
            //     child: Image(
            //       image: AssetImage(image),
            //       // fit: BoxFit.cover,
            //       // color: dark ? TColors.white : TColors.white,
            //     ),
            //   ),
            // ),

            TCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: Tsized.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundcolor,
            ),

            // text

            const SizedBox(
              height: Tsized.spaceBtwItems / 2,
            ),

            SizedBox(
              width: 55,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium!.apply(
                        color: textcolor,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
