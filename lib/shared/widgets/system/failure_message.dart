import 'package:civicos/core/errors/app_failure.dart';
import 'package:civicos/core/validation/validators.dart';
import 'package:civicos/l10n/l10n.dart';

/// Human copy for every failure kind. The exhaustive switch means adding a
/// failure type fails compilation until it has a message.
String failureMessage(AppLocalizations l10n, AppFailure failure) {
  return switch (failure) {
    NetworkFailure() => l10n.errorNetwork,
    AuthFailure() => l10n.errorAuth,
    ValidationFailure() => l10n.errorValidation,
    PermissionFailure() => l10n.errorPermission,
    NotFoundFailure() => l10n.errorNotFound,
    RateLimitedFailure() => l10n.errorRateLimited,
    ConflictFailure() => l10n.errorConflict,
    UnknownFailure() => l10n.errorUnknown,
  };
}

/// Human copy for a validation result; `null` when the value is valid.
String? validationMessage(AppLocalizations l10n, ValidationError? error) {
  return switch (error) {
    null => null,
    ValidationError.required => l10n.validationRequired,
    ValidationError.invalidEmail => l10n.validationEmailInvalid,
    ValidationError.passwordTooShort => l10n.validationPasswordTooShort,
    ValidationError.passwordNeedsLetterAndNumber =>
      l10n.validationPasswordNeedsMix,
    ValidationError.invalidUsername => l10n.validationUsernameInvalid,
    ValidationError.tooLong => l10n.validationTooLong,
  };
}
