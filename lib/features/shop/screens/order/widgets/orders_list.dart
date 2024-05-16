import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/images/t_rounded_container.dart';
import 'package:flutter_ecommerce_project/common/widgets/loaders/animation_loader.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/product/order_controller.dart';
import 'package:flutter_ecommerce_project/navigation_menu.dart';
import 'package:flutter_ecommerce_project/utlis/constants/colors.dart';
import 'package:flutter_ecommerce_project/utlis/constants/image_strings.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/helpers/cloud_helper_functions.dart';
import 'package:flutter_ecommerce_project/utlis/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    // ignore: unused_local_variable
    final dark = THelperfunctions.isDarkMode(context);
    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (context, snapshot) {
          //nothing found widget
          final emptyWidget = TAnimationLoaderWidget(
            text: 'Whoops! No order Yet!',
            animation: TImages.profileImage5,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          //helper function :handle loader ,no record ,or error messgae
          final response = TCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, nothingFound: emptyWidget);
          if (response != null) return response;

          //congratulations record found
          final orders = snapshot.data!;
          return ListView.separated(
              shrinkWrap: true,
              itemCount: orders.length,
              separatorBuilder: (_, __) => const SizedBox(
                    height: Tsized.spaceBtwItems,
                  ),
              itemBuilder: (_, index) {
                final order = orders[index];
                TRoundedContainer(
                    showBorder: true,
                    padding: const EdgeInsets.all(Tsized.md),
                    backgroundColor: THelperfunctions.isDarkMode(context)
                        ? TColors.dark
                        : TColors.light,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //row1
                        Row(
                          children: [
                            //1. icon
                            const Icon(Iconsax.ship),
                            const SizedBox(
                              width: Tsized.spaceBtwItems / 2,
                            ),
                            //2. status and date
                            Expanded(
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      order.orderStatusText,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .apply(
                                              color: TColors.primary,
                                              fontWeightDelta: 1),
                                    ),
                                    Text(order.formattedOrderdate,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall),
                                  ]),
                            ),
                            //3. icon
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Iconsax.arrow_right_34,
                                  size: Tsized.iconSm,
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: Tsized.spaceBtwItems,
                        ),
                        //row2
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  //1. icon
                                  const Icon(Iconsax.ship),
                                  const SizedBox(
                                    width: Tsized.spaceBtwItems / 2,
                                  ),
                                  //2. status and date
                                  Expanded(
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Order',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium),
                                          Text(order.id,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  //1. icon
                                  const Icon(Iconsax.calendar),
                                  const SizedBox(
                                    width: Tsized.spaceBtwItems / 2,
                                  ),
                                  //2. status and date
                                  Expanded(
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Shipping Date',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium),
                                          Text(order.formattedDeliveryDate,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ));
              });
        });
  }
}
