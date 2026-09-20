import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:flutter/material.dart';

/// One number with its label, e.g. "42 — Volunteer hours".
class StatTile extends StatelessWidget {
  const StatTile({required this.value, required this.label, super.key});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final c = context.civic;
    return Semantics(
      container: true,
      label: '$value $label',
      excludeSemantics: true,
      child: Container(
        padding: const EdgeInsets.all(Space.sm),
        decoration: BoxDecoration(
          color: c.surface,
          borderRadius: BorderRadius.circular(Radii.md),
          border: Border.all(color: c.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(value, style: context.type.title1),
            const SizedBox(height: 2),
            Text(label, style: context.type.footnote),
          ],
        ),
      ),
    );
  }
}
