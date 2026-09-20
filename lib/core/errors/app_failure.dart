import 'dart:async';
import 'dart:io';

/// Every error the UI can show. Repositories convert raw exceptions into one
/// of these, and screens `switch` over them exhaustively, so no failure
/// kind can go unhandled.
sealed class AppFailure implements Exception {
  const AppFailure({this.cause});

  /// The original error, kept for logs. Never shown to people.
  final Object? cause;

  /// Whether offering "Try again" makes sense.
  bool get retryable => false;

  /// Maps any thrown object to an [AppFailure].
  static AppFailure from(Object error) => switch (error) {
    final AppFailure failure => failure,
    SocketException() ||
    HttpException() ||
    TimeoutException() => NetworkFailure(cause: error),
    _ => UnknownFailure(cause: error),
  };
}

final class NetworkFailure extends AppFailure {
  const NetworkFailure({super.cause});

  @override
  bool get retryable => true;
}

final class AuthFailure extends AppFailure {
  const AuthFailure({super.cause});
}

final class ValidationFailure extends AppFailure {
  const ValidationFailure({this.fieldErrors = const {}, super.cause});

  /// Field name → message key, for highlighting form fields.
  final Map<String, String> fieldErrors;
}

final class PermissionFailure extends AppFailure {
  const PermissionFailure({super.cause});
}

final class NotFoundFailure extends AppFailure {
  const NotFoundFailure({super.cause});
}

final class RateLimitedFailure extends AppFailure {
  const RateLimitedFailure({this.retryAfter, super.cause});

  final Duration? retryAfter;

  @override
  bool get retryable => true;
}

final class ConflictFailure extends AppFailure {
  const ConflictFailure({super.cause});

  @override
  bool get retryable => true;
}

final class UnknownFailure extends AppFailure {
  const UnknownFailure({super.cause});

  @override
  bool get retryable => true;
}
