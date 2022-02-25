// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:barg_flutter/View/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:barg_flutter/main.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('Login Page setup', (WidgetTester tester) async {
    LoginPage page = const LoginPage();

    await tester.pumpWidget(makeTestableWidget(child: page));

    var textFind = find.byKey(const Key('LoginButton'));

    expect(textFind, findsOneWidget);
  });
}
