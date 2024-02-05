import 'package:go_router/go_router.dart';
import 'package:stradmon_chairs/views/auth/forget_password_view.dart';
import 'package:stradmon_chairs/views/auth/login_view.dart';
import 'package:stradmon_chairs/views/auth/sign_up_view.dart';
import 'package:stradmon_chairs/views/auth/welcome.dart';
import 'package:stradmon_chairs/views/entry.dart';
import 'package:stradmon_chairs/views/payment.dart';
import 'package:stradmon_chairs/routes/on_generate_route.dart';
import 'package:stradmon_chairs/views/cart.dart';
import 'package:stradmon_chairs/views/detail_view.dart';
import 'package:stradmon_chairs/views/favorite.dart';

final GoRouter routes = GoRouter(
  routes: [
    GoRoute(
      name: RoutesGeneric.welcome,
      path: RoutesGeneric.welcomeRoute,
      builder: (context, state) => const WelcomeView(),
    ),
    GoRoute(
      name: RoutesGeneric.entry,
      path: RoutesGeneric.entryRoute,
      builder: (context, state) => const EntryView(),
    ),
    GoRoute(
      name: RoutesGeneric.homeName,
      path: RoutesGeneric.homeRoute,
      builder: (context, state) => const WelcomeView(),
    ),
    GoRoute(
      name: RoutesGeneric.login,
      path: RoutesGeneric.loginRoute,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      name: RoutesGeneric.signup,
      path: RoutesGeneric.signupRoute,
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      name: RoutesGeneric.forgotPassword,
      path: RoutesGeneric.forgotPasswordRoute,
      builder: (context, state) => const ForgetPasswordView(),
    ),
    GoRoute(
      name: RoutesGeneric.productName,
      path: '${RoutesGeneric.productDetailRoute}:id',
      builder: (context, state) => DetailView(
        shirtId: state.pathParameters['id']!,
      ),
    ),
    GoRoute(
      name: RoutesGeneric.favoritesName,
      path: RoutesGeneric.favoritesRoute,
      builder: (context, state) => const FavoriteView(),
    ),
    GoRoute(
      name: RoutesGeneric.cartName,
      path: RoutesGeneric.cartRoute,
      builder: (context, state) => const CartView(),
    ),
    GoRoute(
      name: RoutesGeneric.paymentName,
      path: RoutesGeneric.paymentRoute,
      builder: (context, state) => const PaymentView(),
    ),
  ],
);
