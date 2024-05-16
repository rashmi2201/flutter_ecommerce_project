import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/success_screen/success_screen.dart';
import 'package:flutter_ecommerce_project/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/address_controller.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/product/cart_controller.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/product/checkout_controller.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/product/order_repository.dart';
import 'package:flutter_ecommerce_project/features/shop/models/order_model.dart';
import 'package:flutter_ecommerce_project/navigation_menu.dart';
import 'package:flutter_ecommerce_project/utlis/constants/enums.dart';
import 'package:flutter_ecommerce_project/utlis/constants/image_strings.dart';
import 'package:flutter_ecommerce_project/utlis/popups/full_screen_loader.dart';
import 'package:flutter_ecommerce_project/utlis/popups/loaders.dart';
import 'package:get/get.dart';

class OrderController extends GetxController{
  static OrderController get instance=> Get.find();

  //variables
  final cartController=CartController.instance;
  final addressController=AddressController.instance;
  final checkoutController=CheckoutController.instance;
  final orderRepository=Get.put(OrderRepository());

  //fetch users order history
  Future<List<OrderModel>> fetchUserOrders() async{

    try{
      final userOrders=await orderRepository.fetchUserOrders();
      return userOrders;
    }catch(e){
      TLoaders.warningSnackBar(title: 'Oh Snap!',message: e.toString());
      return[];
    }
  }


// add methods for order processing
void processOrder(double totalAmount) async{
  try{
    //start loder
    TFullScreenLoader.openLoadingDialog('Processing your order', TImages.orderprocess);

    //Get user authentication id
    final userId= AuthenticationRepository.instance.authUser?.uid;
    if(userId==null || userId.isEmpty){
      throw 'Unable to process order.userId is empty or null';
    };

    //add details
    final order=OrderModel(
      id: UniqueKey().toString(), 
      userId: userId,
      status: OrderStatus.pending, 
          totalAmount: totalAmount, 
             orderDate: DateTime.now(),
             paymentMethod: checkoutController.selectedPaymentMethod.value.name,
             address: addressController.selectedAddress.value,
             //set date as needed
             deliveryDate: DateTime.now(),


   
      items:cartController.cartItems.toList(), 
  
   );

   //save the order to firestore
   await orderRepository.saveOrder(order, userId);

   //Update the cart status
   cartController.clearCart();

   //show success screen
   Get.off(()=> SuccessScreen(
    image: TImages.paymentsucceed, 
    title: 'Payment Sucess!', 
    subtitle: 'Your item will be shipped soon!', 
    onPressed: ()=> Get.offAll(()=> const NavigationMenu())
    ));

  }catch(e){
    TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
  }
}


}