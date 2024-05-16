
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/home/widgets/shimmers/shimmer.dart';
import 'package:flutter_ecommerce_project/utlis/constants/colors.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/helpers/helper_functions.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = Tsized.sm,
    this.overlaycolor,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? backgroundColor;
  final Color? overlaycolor;
  final double width, height, padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        //if image background color is null then swith it to light and dark mode color design
        color: backgroundColor ??
            (THelperfunctions.isDarkMode(context)
                ? TColors.black
                : TColors.white),

        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: image,
                  fit: fit,
                  // color: overlaycolor,
                  progressIndicatorBuilder: (context, url, DownloadProgress) =>
                      const TShimmerEffect(width: 55, height: 55,radius: 55,),
                  errorWidget: (context,url,error) => const Icon(Icons.error),
                )
              : Image(
                  fit: fit,
                  // color: overlaycolor,
                  image:  AssetImage(image)),
        ),
      ),
    );
  }
}