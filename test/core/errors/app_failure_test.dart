import 'dart:async';
import 'dart:io';

import 'package:civicos/core/errors/app_failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppFailure.from', () {
    test('passes existing failures through unchanged', () {
      const failure = NotFoundFailure();
      expect(AppFailure.from(failure), same(failure));
    });

    test('maps connectivity problems to NetworkFailure', () {
      for (final error in <Object>[
        const SocketException('no route'),
        const HttpException('reset'),
        TimeoutException('slow'),
      ]) {
        final failure = AppFailure.from(error);
        expect(failure, isA<NetworkFailure>());
        expect(failure.cause, same(error));
      }
    });

    test('maps anything else to UnknownFailure and keeps the cause', () {
      final error = StateError('boom');
      final failure = AppFailure.from(error);
      expect(failure, isA<UnknownFailure>());
      expect(failure.cause, same(error));
    });
  });

  test('only transient failures offer a retry', () {
    expect(const NetworkFailure().retryable, isTrue);
    expect(const RateLimitedFailure().retryable, isTrue);
    expect(const ConflictFailure().retryable, isTrue);
    expect(const UnknownFailure().retryable, isTrue);
    expect(const AuthFailure().retryable, isFalse);
    expect(const PermissionFailure().retryable, isFalse);
    expect(const NotFoundFailure().retryable, isFalse);
    expect(const ValidationFailure().retryable, isFalse);
  });
}
