import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:civicos/app/theme/tone.dart';
import 'package:civicos/core/utils/relative_time.dart';
import 'package:civicos/features/missions/domain/mission.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:civicos/shared/widgets/ui/civic_card.dart';
import 'package:civicos/shared/widgets/ui/progress_bar.dart';
import 'package:civicos/shared/widgets/ui/status_badge.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// A mission with its objectives and progress. Progress only moves when an
/// action is verified, never from ticking a box here.
class MissionCard extends StatelessWidget {
  const MissionCard({required this.mission, super.key});

  final Mission mission;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final c = context.civic;

    return CivicCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(mission.title, style: context.type.headline),
              ),
              if (mission.joined) ...[
                const SizedBox(width: Space.xs),
                StatusBadge(
                  label: l10n.missionJoined,
                  icon: LucideIcons.check,
                  tone: Tone.success,
                ),
              ],
            ],
          ),
          const SizedBox(height: Space.xxs),
          Text(
            mission.summary,
            style: context.type.callout.copyWith(color: c.textMuted),
          ),
          const SizedBox(height: Space.sm),
          ProgressBar(
            value: mission.progress,
            semanticLabel: l10n.missionProgressSemantics,
          ),
          const SizedBox(height: Space.xs),
          Text(
            l10n.missionTasksDone(mission.tasksDone, mission.tasks.length),
            style: context.type.footnote,
          ),
          const SizedBox(height: Space.xs),
          for (final task in mission.tasks)
            Padding(
              padding: const EdgeInsets.only(bottom: Space.xxs),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    task.isDone
                        ? LucideIcons.squareCheckBig
                        : LucideIcons.circleDot,
                    size: 16,
                    color: task.isDone ? c.success : c.textMuted,
                  ),
                  const SizedBox(width: Space.xs),
                  Expanded(
                    child: Text(
                      task.label,
                      style: context.type.callout.copyWith(
                        color: task.isDone ? c.textMuted : c.text,
                      ),
                    ),
                  ),
                  Text(
                    '${task.completed}/${task.target}',
                    style: context.type.footnote,
                  ),
                ],
              ),
            ),
          const SizedBox(height: Space.xs),
          Wrap(
            spacing: Space.sm,
            runSpacing: Space.xxs,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Space.xs,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: c.accentWash,
                  borderRadius: BorderRadius.circular(Radii.pill),
                ),
                child: Text(
                  l10n.missionReward(mission.xpReward),
                  style: context.type.footnote.copyWith(
                    color: c.accentText,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                l10n.taking_part(mission.participants),
                style: context.type.footnote,
              ),
              Text(
                l10n.missionEnds(relativeFuture(l10n, mission.endsAt)),
                style: context.type.footnote,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
