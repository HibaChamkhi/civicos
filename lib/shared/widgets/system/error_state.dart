import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/core/errors/app_failure.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:civicos/shared/widgets/system/failure_message.dart';
import 'package:civicos/shared/widgets/ui/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Explains a failure in plain words, and offers a retry when it can help.
/// Announced to screen readers as soon as it appears.
class ErrorState extends StatelessWidget {
  const ErrorState({required this.failure, super.key, this.onRetry});

  final AppFailure failure;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final c = context.civic;
    final canRetry = failure.retryable && onRetry != null;
    return Semantics(
      liveRegion: true,
      child: EmptyState(
        icon: LucideIcons.circleAlert,
        iconColor: c.danger,
        iconBackground: c.surfaceSunken,
        title: l10n.errorTitle,
        body: failureMessage(l10n, failure),
        actionLabel: canRetry ? l10n.retry : null,
        onAction: canRetry ? onRetry : null,
      ),
    );
  }
}
