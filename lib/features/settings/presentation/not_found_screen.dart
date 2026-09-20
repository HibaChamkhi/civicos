import 'package:civicos/app/router/routes.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:civicos/shared/widgets/ui/civic_scaffold.dart';
import 'package:civicos/shared/widgets/ui/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Shown for unknown deep links and unavailable screens.
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return CivicScaffold(
      title: l10n.appTitle,
      children: [
        EmptyState(
          icon: LucideIcons.compass,
          title: l10n.notFoundTitle,
          body: l10n.notFoundBody,
          actionLabel: l10n.notFoundAction,
          onAction: () => const HomeRoute().go(context),
        ),
      ],
    );
  }
}
