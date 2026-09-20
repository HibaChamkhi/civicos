import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:civicos/shared/widgets/ui/civic_button.dart';
import 'package:flutter/material.dart';

/// What a screen shows when there's nothing to list yet. Always offers a
/// next step, so an empty screen is never a dead end.
class EmptyState extends StatelessWidget {
  const EmptyState({
    required this.icon,
    required this.title,
    required this.body,
    super.key,
    this.actionLabel,
    this.onAction,
    this.secondaryActionLabel,
    this.onSecondaryAction,
    this.iconColor,
    this.iconBackground,
  });

  final IconData icon;
  final String title;
  final String body;
  final String? actionLabel;
  final VoidCallback? onAction;
  final String? secondaryActionLabel;
  final VoidCallback? onSecondaryAction;

  /// Overrides for non-default tones, e.g. errors.
  final Color? iconColor;
  final Color? iconBackground;

  @override
  Widget build(BuildContext context) {
    final c = context.civic;
    final actionLabel = this.actionLabel;
    final secondaryActionLabel = this.secondaryActionLabel;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Space.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExcludeSemantics(
            child: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: iconBackground ?? c.accentWash,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, size: 26, color: iconColor ?? c.accentText),
            ),
          ),
          const SizedBox(height: Space.md),
          Semantics(
            header: true,
            child: Text(title, style: context.type.title2),
          ),
          const SizedBox(height: Space.xs),
          Text(body, style: context.type.body.copyWith(color: c.textMuted)),
          if (actionLabel != null && onAction != null) ...[
            const SizedBox(height: Space.lg),
            CivicButton(label: actionLabel, onPressed: onAction),
          ],
          if (secondaryActionLabel != null && onSecondaryAction != null) ...[
            const SizedBox(height: Space.xs),
            CivicButton(
              label: secondaryActionLabel,
              onPressed: onSecondaryAction,
              variant: CivicButtonVariant.ghost,
            ),
          ],
        ],
      ),
    );
  }
}
