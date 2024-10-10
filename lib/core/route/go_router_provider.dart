

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:youcancode/core/route/route_name.dart';
import 'package:youcancode/features/login/presentation/ui/login_screen.dart';
import 'package:youcancode/features/signup/presentation/ui/signup_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        name: loginRoute,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/singup',
        name: singUpRoute,
        builder: (context, state) => const SingUpScreen(),
      ),
    ],
  );

});