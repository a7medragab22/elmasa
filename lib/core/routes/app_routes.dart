import 'package:elmasa/features/auth/presentation/views/sign_up_view.dart';
import 'package:elmasa/features/auth/presentation/views/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:elmasa/features/home/presentation/pages/home_view.dart';
import 'package:elmasa/features/blog/presentation/pages/blog_view.dart';
import 'package:elmasa/features/return_policy/presentation/pages/return_policy_view.dart';
import 'package:elmasa/features/terms_conditions/presentation/pages/terms_conditions_view.dart';
import 'package:elmasa/features/delivery_service/presentation/pages/delivery_service_view.dart';
import 'package:elmasa/features/privacy_policy/presentation/pages/privacy_policy_view.dart';
import 'package:elmasa/features/contact_us/presentation/pages/contact_us_view.dart';
import 'package:elmasa/features/return_method/presentation/pages/return_method_view.dart';
import 'package:elmasa/features/gift_policy/presentation/pages/gift_policy_view.dart';
import 'package:elmasa/features/sad_vip_points/presentation/pages/sad_vip_points_view.dart';
import 'package:elmasa/features/products/presentation/pages/products_view.dart';
import 'package:elmasa/features/cart/presentation/pages/cart_view.dart';
import 'package:elmasa/features/checkout/presentation/pages/checkout_view.dart';
import 'app_routes_name.dart';

class AppRoutes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case SigninView.routeName:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case SignUpView.routeName:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case AppRouteNames.blog:
        return MaterialPageRoute(builder: (_) => const BlogView());
      case AppRouteNames.returnPolicy:
        return MaterialPageRoute(builder: (_) => const ReturnPolicyView());
      case AppRouteNames.termsConditions:
        return MaterialPageRoute(builder: (_) => const TermsConditionsView());
      case AppRouteNames.deliveryService:
        return MaterialPageRoute(builder: (_) => const DeliveryServiceView());
      case AppRouteNames.privacyPolicy:
        return MaterialPageRoute(builder: (_) => const PrivacyPolicyView());
      case AppRouteNames.contactUs:
        return MaterialPageRoute(builder: (_) => const ContactUsView());
      case AppRouteNames.returnMethod:
        return MaterialPageRoute(builder: (_) => const ReturnMethodView());
      case AppRouteNames.giftPolicy:
        return MaterialPageRoute(builder: (_) => const GiftPolicyView());
      case AppRouteNames.sadVipPoints:
        return MaterialPageRoute(builder: (_) => const SadVipPointsView());
      case AppRouteNames.signin:
        return MaterialPageRoute(builder: (_) => const SigninView());
      case AppRouteNames.signup:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case AppRouteNames.products:
        final tag = settings.arguments as String?;
        return MaterialPageRoute(builder: (_) => ProductsView(tag: tag));
      case AppRouteNames.cart:
        return MaterialPageRoute(builder: (_) => const CartView());
      case AppRouteNames.checkout:
        return MaterialPageRoute(builder: (_) => const CheckoutView());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
