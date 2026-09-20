import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:flutter/material.dart';

/// Mono uppercase eyebrow that introduces a group of rows.
class SectionLabel extends StatelessWidget {
  const SectionLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(
        Space.xxs,
        Space.xl,
        0,
        Space.xs,
      ),
      child: Semantics(
        header: true,
        child: Text(text.toUpperCase(), style: context.type.label),
      ),
    );
  }
}
