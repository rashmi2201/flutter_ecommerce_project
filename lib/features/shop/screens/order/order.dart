import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/appbar/appbar.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/order/widgets/orders_list.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        titlee: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showbackarrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(Tsized.defaultSpace),
        //orders
        child: TOrderListItems(),
      ),
    );
  }
}
