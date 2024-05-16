import 'package:flutter_ecommerce_project/features/authentication/screens/home/home.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/onboarding/login/login.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/onboarding/signup.widgets/signup.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/onboarding/signup.widgets/verify_email.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:flutter_ecommerce_project/features/personalization/screens/address/widgets/address.dart';
import 'package:flutter_ecommerce_project/features/personalization/screens/profile/widgets/profile.dart';
import 'package:flutter_ecommerce_project/features/personalization/screens/settings/settings.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/cart/cart.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/checkout/checkout.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/order/order.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/product_reviews/widgets/product_reviews.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/store/store.dart';
import 'package:flutter_ecommerce_project/features/shop/wishlist/wishlist.dart';
import 'package:flutter_ecommerce_project/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const StoreScreen()),
    GetPage(name: TRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingScreen()),
    GetPage(name: TRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: TRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}
