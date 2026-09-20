import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:civicos/core/utils/formatters.dart';
import 'package:civicos/features/impact/domain/impact_summary.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Seven bars, one per day, scaled to the busiest day of the week. Each bar
/// carries its own screen-reader label, so the chart isn't visual-only.
class WeeklyBars extends StatelessWidget {
  const WeeklyBars({required this.week, super.key, this.height = 92});

  final List<DailyContribution> week;
  final double height;

  @override
  Widget build(BuildContext context) {
    final c = context.civic;
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final dayFormat = DateFormat.E(locale);
    final longDayFormat = DateFormat.EEEE(locale);
    final peak = week.fold<double>(
      0,
      (max, day) => day.hours > max ? day.hours : max,
    );
    final reduceMotion = MediaQuery.disableAnimationsOf(context);

    return SizedBox(
      height: height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (final day in week)
            Expanded(
              child: Semantics(
                label: l10n.weekChartSemantics(
                  Formatters.decimal(day.hours),
                  longDayFormat.format(day.day),
                ),
                excludeSemantics: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final fraction = peak == 0 ? 0.0 : day.hours / peak;
                            return Align(
                              alignment: Alignment.bottomCenter,
                              child: TweenAnimationBuilder<double>(
                                tween: Tween(end: fraction),
                                duration: reduceMotion
                                    ? Duration.zero
                                    : Motion.slow,
                                curve: Motion.standard,
                                builder: (context, value, _) => Container(
                                  height: (constraints.maxHeight * value).clamp(
                                    day.hours > 0 ? 6.0 : 3.0,
                                    constraints.maxHeight,
                                  ),
                                  decoration: BoxDecoration(
                                    color: day.hours > 0
                                        ? c.accent
                                        : c.surfaceSunken,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: Space.xs),
                      Text(
                        dayFormat.format(day.day),
                        style: context.type.footnote,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
