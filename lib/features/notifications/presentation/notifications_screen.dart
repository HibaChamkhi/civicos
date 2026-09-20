import 'package:civicos/app/router/routes.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:civicos/shared/widgets/ui/civic_scaffold.dart';
import 'package:civicos/shared/widgets/ui/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return CivicScaffold(
      title: l10n.notificationsTitle,
      children: [
        EmptyState(
          icon: LucideIcons.inbox,
          title: l10n.notificationsEmptyTitle,
          body: l10n.notificationsEmptyBody,
          actionLabel: l10n.notificationsEmptyAction,
          onAction: () => const HomeRoute().go(context),
        ),
      ],
    );
  }
}
