import 'package:civicos/core/env/env.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Env.parseAppEnv', () {
    test('parses every known environment', () {
      expect(Env.parseAppEnv('development'), AppEnv.development);
      expect(Env.parseAppEnv('staging'), AppEnv.staging);
      expect(Env.parseAppEnv('production'), AppEnv.production);
    });

    test('explains how to fix a missing value', () {
      expect(
        () => Env.parseAppEnv(''),
        throwsA(
          isA<EnvException>().having(
            (e) => e.message,
            'message',
            allOf(contains('missing'), contains('--dart-define-from-file')),
          ),
        ),
      );
    });

    test('rejects unknown values and echoes them back', () {
      expect(
        () => Env.parseAppEnv('prod'),
        throwsA(
          isA<EnvException>().having(
            (e) => e.message,
            'message',
            contains('"prod"'),
          ),
        ),
      );
    });
  });

  test('only development is a development build', () {
    expect(AppEnv.development.isDevelopment, isTrue);
    expect(AppEnv.staging.isDevelopment, isFalse);
    expect(AppEnv.production.isDevelopment, isFalse);
  });
}
