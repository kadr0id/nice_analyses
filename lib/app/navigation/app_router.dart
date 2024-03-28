import 'package:go_router/go_router.dart';
import 'package:nice_analyses/app/routes/routes.dart';
import 'package:nice_analyses/faq/faq.dart';
import 'package:nice_analyses/forgot_password/view/forgot_password_page.dart';
import 'package:nice_analyses/sign_in/sign_in.dart';
import 'package:nice_analyses/sign_up/sign_up.dart';

class AppRouter {
  // static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  //static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    initialLocation: Routes.signInPage,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.signInPage,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SignInPage(),
        ),
      ),
      GoRoute(
        path: Routes.signUpPage,
        builder: (context, state) => const SignUpPage(),
        routes: [
          GoRoute(
              path: Routes.faqPage,
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: FaqPage(),
                );
              }),
        ],
      ),
      GoRoute(
        path: Routes.forgotPasswordPage,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: ForgotPasswordPage(),
        ),
      ),
    ],
    //  ),
    //  ],
  );

  static GoRouter get router => _router;
}
