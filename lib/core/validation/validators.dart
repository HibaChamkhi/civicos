/// Why a value was rejected. The UI maps each case to localized copy, so
/// validation logic stays pure and testable.
enum ValidationError {
  required,
  invalidEmail,
  passwordTooShort,
  passwordNeedsLetterAndNumber,
  invalidUsername,
  tooLong,
}

/// Input rules shared by forms and, later, the data layer. Limits mirror the
/// database check constraints so the server never rejects what the app
/// accepted.
abstract final class Validators {
  static const passwordMinLength = 8;
  static const displayNameMaxLength = 60;
  static const bioMaxLength = 280;

  static final RegExp _email = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]{2,}$');
  static final RegExp _username = RegExp(r'^[a-z0-9_]{3,24}$');
  static final RegExp _letter = RegExp('[A-Za-z]');
  static final RegExp _digit = RegExp('[0-9]');

  static ValidationError? email(String? input) {
    final value = input?.trim() ?? '';
    if (value.isEmpty) return ValidationError.required;
    if (!_email.hasMatch(value)) return ValidationError.invalidEmail;
    return null;
  }

  static ValidationError? password(String? input) {
    final value = input ?? '';
    if (value.isEmpty) return ValidationError.required;
    if (value.length < passwordMinLength) {
      return ValidationError.passwordTooShort;
    }
    if (!_letter.hasMatch(value) || !_digit.hasMatch(value)) {
      return ValidationError.passwordNeedsLetterAndNumber;
    }
    return null;
  }

  /// Matches `profiles.username` (`^[a-z0-9_]{3,24}$`).
  static ValidationError? username(String? input) {
    final value = input?.trim() ?? '';
    if (value.isEmpty) return ValidationError.required;
    if (!_username.hasMatch(value)) return ValidationError.invalidUsername;
    return null;
  }

  /// Counts Unicode code points, like Postgres `char_length`.
  static ValidationError? displayName(String? input) {
    final value = input?.trim() ?? '';
    if (value.isEmpty) return ValidationError.required;
    if (value.runes.length > displayNameMaxLength) {
      return ValidationError.tooLong;
    }
    return null;
  }
}
