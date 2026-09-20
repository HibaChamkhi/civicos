import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:civicos/app/theme/tone.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:flutter/material.dart';

/// A status pill. Status is carried by an icon, a text label and (for
/// lifecycles) step ticks. Color is only a reinforcement.
class StatusBadge extends StatelessWidget {
  const StatusBadge({
    required this.label,
    required this.icon,
    required this.tone,
    super.key,
    this.step,
    this.totalSteps,
  }) : assert(
         (step == null) == (totalSteps == null),
         'Pass both step and totalSteps, or neither.',
       );

  final String label;
  final IconData icon;
  final Tone tone;

  /// 1-based position in a lifecycle, e.g. 5 of 6 for "In progress".
  final int? step;
  final int? totalSteps;

  @override
  Widget build(BuildContext context) {
    final c = context.civic;
    final color = c.toneColor(tone);
    final l10n = context.l10n;
    final step = this.step;
    final totalSteps = this.totalSteps;
    final semantics = step != null && totalSteps != null
        ? l10n.statusWithStep(label, step, totalSteps)
        : l10n.statusOnly(label);

    return Semantics(
      container: true,
      label: semantics,
      excludeSemantics: true,
      child: Container(
        constraints: const BoxConstraints(minHeight: 32),
        padding: const EdgeInsetsDirectional.fromSTEB(8, 5, 11, 5),
        decoration: BoxDecoration(
          color: c.surface,
          borderRadius: BorderRadius.circular(Radii.pill),
          border: Border.all(color: color, width: 1.5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                label,
                style: context.type.callout.copyWith(
                  color: color,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            if (step != null && totalSteps != null) ...[
              const SizedBox(width: 8),
              _StepTicks(step: step, total: totalSteps, color: color),
            ],
          ],
        ),
      ),
    );
  }
}

class _StepTicks extends StatelessWidget {
  const _StepTicks({
    required this.step,
    required this.total,
    required this.color,
  });

  final int step;
  final int total;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < total; i++)
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 2),
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: i < step ? color : color.withValues(alpha: 0.22),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
      ],
    );
  }
}
