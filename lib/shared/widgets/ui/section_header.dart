import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:flutter/material.dart';

/// Title above a group of cards, with an optional action on the right.
class SectionHeader extends StatelessWidget {
  const SectionHeader(
    this.title, {
    super.key,
    this.actionLabel,
    this.onAction,
  });

  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final actionLabel = this.actionLabel;
    final onAction = this.onAction;

    return Padding(
      padding: const EdgeInsets.only(top: Space.xl, bottom: Space.sm),
      child: Row(
        children: [
          Expanded(
            child: Semantics(
              header: true,
              child: Text(title, style: context.type.title2),
            ),
          ),
          if (actionLabel != null && onAction != null)
            TextButton(
              onPressed: onAction,
              style: TextButton.styleFrom(
                foregroundColor: context.civic.text,
                textStyle: context.type.headline,
                minimumSize: const Size(0, Sizes.minTouchTarget),
              ),
              child: Text(actionLabel),
            ),
        ],
      ),
    );
  }
}
