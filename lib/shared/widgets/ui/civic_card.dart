import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:flutter/material.dart';

/// A surface for one actionable object, or a group of settings rows. Lists
/// of similar things use `ListRow`s rather than stacks of cards.
class CivicCard extends StatelessWidget {
  const CivicCard({
    required this.child,
    super.key,
    this.onTap,
    this.padding = const EdgeInsets.all(Space.md),
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final c = context.civic;
    return Material(
      color: c.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Radii.lg),
        side: BorderSide(color: c.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: onTap == null
          ? Padding(padding: padding, child: child)
          : InkWell(
              onTap: onTap,
              child: Padding(padding: padding, child: child),
            ),
    );
  }
}
