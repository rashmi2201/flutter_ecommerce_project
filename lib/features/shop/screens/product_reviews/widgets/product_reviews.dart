import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/appbar/appbar.dart';
import 'package:flutter_ecommerce_project/common/widgets/products/ratings/rating_indicator.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        titlee: Text('Reviews & Ratings'),
      showbackarrow: true,
      ),

      //body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Tsized.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                'Ratings and reviews are verified and are from people who use the same type of device that you use.'),
            const SizedBox(
              height: Tsized.spaceBtwItems,
            ),
            //overall product rating
            const TOverallProductRating(),
            const TRatingBarIndicator(rating: 3.5),
            Text(
              '12,611',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: Tsized.spaceBtwSections,
            ),
            //user review list

            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),
          ],
        ),
      ),
    );
  }
}
