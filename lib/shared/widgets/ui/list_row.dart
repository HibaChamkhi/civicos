import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// A flat, full-width row for settings and lists. Tappable rows get a
/// direction-aware chevron unless [trailing] replaces it.
class ListRow extends StatelessWidget {
  const ListRow({
    required this.title,
    super.key,
    this.subtitle,
    this.leadingIcon,
    this.trailing,
    this.onTap,
  });

  final String title;
  final String? subtitle;
  final IconData? leadingIcon;

  /// Replaces the chevron, e.g. with a switch.
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.civic;
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final subtitle = this.subtitle;
    final trailing = this.trailing;

    return MergeSemantics(
      child: Semantics(
        button: onTap != null && trailing == null,
        child: InkWell(
          onTap: onTap,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 56),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Space.md,
                vertical: Space.sm,
              ),
              child: Row(
                children: [
                  if (leadingIcon != null) ...[
                    Icon(leadingIcon, size: 22, color: c.text),
                    const SizedBox(width: Space.md),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: context.type.body),
                        if (subtitle != null) ...[
                          const SizedBox(height: 2),
                          Text(subtitle, style: context.type.footnote),
                        ],
                      ],
                    ),
                  ),
                  if (trailing != null) ...[
                    const SizedBox(width: Space.sm),
                    trailing,
                  ] else if (onTap != null) ...[
                    const SizedBox(width: Space.sm),
                    Icon(
                      isRtl
                          ? LucideIcons.chevronLeft
                          : LucideIcons.chevronRight,
                      size: 20,
                      color: c.textMuted,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
