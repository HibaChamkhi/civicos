import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:flutter/material.dart';

/// Marker-yellow progress bar, e.g. XP toward the next level.
class ProgressBar extends StatelessWidget {
  const ProgressBar({
    required this.value,
    required this.semanticLabel,
    super.key,
  });

  /// Progress from 0 to 1. Values outside the range are clamped.
  final double value;

  /// What the progress is for, e.g. "Progress to Community Builder".
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    final c = context.civic;
    final clamped = value.clamp(0.0, 1.0);
    final percent = (clamped * 100).round();
    final reduceMotion = MediaQuery.disableAnimationsOf(context);

    return Semantics(
      container: true,
      label: context.l10n.progressSemantics(semanticLabel, percent),
      excludeSemantics: true,
      child: Container(
        height: 10,
        decoration: BoxDecoration(
          color: c.surfaceSunken,
          borderRadius: BorderRadius.circular(Radii.pill),
          border: Border.all(color: c.border),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Radii.pill),
          child: TweenAnimationBuilder<double>(
            tween: Tween(end: clamped),
            duration: reduceMotion ? Duration.zero : Motion.slow,
            curve: Motion.standard,
            builder: (context, fill, _) => Align(
              alignment: AlignmentDirectional.centerStart,
              child: FractionallySizedBox(
                widthFactor: fill,
                heightFactor: 1,
                child: ColoredBox(color: c.accent),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
