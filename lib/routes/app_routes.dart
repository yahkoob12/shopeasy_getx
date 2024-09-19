import 'package:get/get.dart';
import 'package:shopeasy_getx/features/authentication/screens/login/login.dart';
import 'package:shopeasy_getx/features/authentication/screens/onboarding/onboarding.dart';
import 'package:shopeasy_getx/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:shopeasy_getx/features/authentication/screens/signup/signup.dart';
import 'package:shopeasy_getx/features/authentication/screens/signup/verify_email.dart';
import 'package:shopeasy_getx/features/personalization/screens/address/address.dart';
import 'package:shopeasy_getx/features/personalization/screens/profile/profile.dart';
import 'package:shopeasy_getx/features/personalization/screens/setting/settings.dart';
import 'package:shopeasy_getx/features/shop/screens/cart/cart.dart';
import 'package:shopeasy_getx/features/shop/screens/checkout/checkout.dart';
import 'package:shopeasy_getx/features/shop/screens/home/home.dart';
import 'package:shopeasy_getx/features/shop/screens/order/order.dart';
import 'package:shopeasy_getx/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:shopeasy_getx/features/shop/screens/store/store.dart';
import 'package:shopeasy_getx/features/shop/screens/wishlist/wishlist.dart';
import 'package:shopeasy_getx/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => HomeScreen()),
    GetPage(name: TRoutes.store, page: () => StoreScreen()),
    GetPage(name: TRoutes.favourites, page: () => FevouriteScreen()),
    GetPage(name: TRoutes.setting, page: () => SettingsScreen()),
    GetPage(name: TRoutes.productReviews, page: () => TProductReviewsScreen()),
    GetPage(name: TRoutes.order, page: () => OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => UserAddressScreen()),
    GetPage(name: TRoutes.signup, page: () => SignupScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => ForgetPassword()),
    GetPage(name: TRoutes.onBoarding, page: () => OnBoardingScreen()),
  ];
}
