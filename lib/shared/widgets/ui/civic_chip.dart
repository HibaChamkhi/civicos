import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Toggleable filter chip. Selection shows as a filled pill *and* a check
/// mark, so it doesn't rely on color.
class CivicChip extends StatelessWidget {
  const CivicChip({
    required this.label,
    required this.selected,
    required this.onSelected,
    super.key,
    this.icon,
  });

  final String label;
  final bool selected;
  final ValueChanged<bool> onSelected;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final c = context.civic;
    final foreground = selected ? c.onPrimary : c.text;
    final leading = selected ? LucideIcons.check : icon;
    const shape = StadiumBorder();

    return Semantics(
      container: true,
      button: true,
      selected: selected,
      label: label,
      onTap: () => onSelected(!selected),
      excludeSemantics: true,
      child: Material(
        color: selected ? c.primary : c.surface,
        shape: shape.copyWith(
          side: BorderSide(
            color: selected ? c.primary : c.borderStrong,
            width: 1.5,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          customBorder: shape,
          onTap: () => onSelected(!selected),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: Sizes.minTouchTarget),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Space.md),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leading != null) ...[
                    Icon(leading, size: 18, color: foreground),
                    const SizedBox(width: 6),
                  ],
                  Flexible(
                    child: Text(
                      label,
                      style: context.type.callout.copyWith(
                        color: foreground,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
