import 'package:flutter_test/flutter_test.dart';
import 'package:barg_flutter/ViewModel/LoginService.dart';

void main() {
  test('empty userName returns error string', () {
    final result = UsernameValidator.validate(true);
    expect(result, 'Username Can\'t Be Empty');
  });

  test('non-empty userName returns null', () {
    final result = UsernameValidator.validate(false);
    expect(result, null);
  });

  test('empty password returns error string', () {
    final result = PasswordValidator.validate(true);
    expect(result, 'Password Can\'t Be Empty');
  });

  test('non-empty password returns null', () {
    final result = PasswordValidator.validate(false);
    expect(result, null);
  });
}
