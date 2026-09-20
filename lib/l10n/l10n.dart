import 'package:civicos/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';

export 'package:civicos/l10n/app_localizations.dart';

extension L10nContext on BuildContext {
  /// Localized strings for the current locale.
  AppLocalizations get l10n => AppLocalizations.of(this);
}
