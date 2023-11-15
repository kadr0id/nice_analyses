import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:nice_analyses/sign_in/view/sign_in_page.dart';
import 'package:nice_analyses/sign_in/view/sign_in_view.dart';



void main() {
  group('SignInPage', () {
    test('is routable', () {
      expect(SignInPage.route(), isA<MaterialPageRoute>());
    });

    testWidgets('renders a SignInView', (tester) async {
      await tester.pumpApp(
        Navigator(onGenerateRoute: (_) => SignInPage.route()),
      );
      expect(find.byType(SignInView), findsOneWidget);
    });

    testWidgets('pops on back button press', (tester) async {
      final navigator = MockNavigator();
      await tester.pumpApp(
        MockNavigatorProvider(
          navigator: navigator,
          child: const SignInPage(),
        ),
      );
      await tester.tap(find.byKey(const Key('signInPage_back_button')));
      await tester.pumpAndSettle();
      verify(navigator.pop).called(1);
    });
  });
}
