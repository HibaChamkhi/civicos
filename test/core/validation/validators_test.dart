import 'package:civicos/core/validation/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Validators.email', () {
    test('requires a value', () {
      expect(Validators.email(null), ValidationError.required);
      expect(Validators.email('   '), ValidationError.required);
    });

    test('rejects addresses without a domain', () {
      expect(Validators.email('amine@exmple'), ValidationError.invalidEmail);
      expect(
        Validators.email('amine.example.com'),
        ValidationError.invalidEmail,
      );
      expect(Validators.email('a b@example.com'), ValidationError.invalidEmail);
    });

    test('accepts valid addresses and ignores surrounding spaces', () {
      expect(Validators.email('amine@example.com'), isNull);
      expect(Validators.email('  sara.k+civic@mail.co.uk '), isNull);
    });
  });

  group('Validators.password', () {
    test('requires a value', () {
      expect(Validators.password(''), ValidationError.required);
    });

    test('needs at least 8 characters', () {
      expect(Validators.password('abc123'), ValidationError.passwordTooShort);
    });

    test('needs a letter and a number', () {
      expect(
        Validators.password('abcdefgh'),
        ValidationError.passwordNeedsLetterAndNumber,
      );
      expect(
        Validators.password('12345678'),
        ValidationError.passwordNeedsLetterAndNumber,
      );
    });

    test('accepts a strong enough password', () {
      expect(Validators.password('streetlight42'), isNull);
    });
  });

  group('Validators.username', () {
    test('matches the database constraint', () {
      expect(Validators.username('amine_22'), isNull);
      expect(Validators.username('ab'), ValidationError.invalidUsername);
      expect(Validators.username('Amine'), ValidationError.invalidUsername);
      expect(Validators.username('a' * 25), ValidationError.invalidUsername);
      expect(Validators.username('amine-22'), ValidationError.invalidUsername);
      expect(Validators.username(''), ValidationError.required);
    });
  });

  group('Validators.displayName', () {
    test('requires non-blank text', () {
      expect(Validators.displayName('  '), ValidationError.required);
    });

    test('counts code points like Postgres char_length', () {
      expect(Validators.displayName('é' * 60), isNull);
      expect(Validators.displayName('😀' * 60), isNull);
      expect(Validators.displayName('a' * 61), ValidationError.tooLong);
    });
  });
}
