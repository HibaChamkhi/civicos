import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:civicos/features/learning/domain/lesson.dart';
import 'package:civicos/features/learning/presentation/lesson_labels.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:civicos/shared/widgets/ui/civic_card.dart';
import 'package:civicos/shared/widgets/ui/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// A lesson with its topic, length and how far you've got.
class LessonCard extends StatelessWidget {
  const LessonCard({required this.lesson, super.key});

  final Lesson lesson;

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
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: c.accentWash,
                  borderRadius: BorderRadius.circular(Radii.sm),
                ),
                child: Icon(
                  lessonTopicIcon(lesson.topic),
                  size: 20,
                  color: c.accentText,
                ),
              ),
              const SizedBox(width: Space.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lessonTopicLabel(l10n, lesson.topic).toUpperCase(),
                      style: context.type.label,
                    ),
                    const SizedBox(height: 2),
                    Text(lesson.title, style: context.type.headline),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: Space.xs),
          Text(
            lesson.summary,
            style: context.type.callout.copyWith(color: c.textMuted),
          ),
          if (lesson.isStarted && !lesson.isComplete) ...[
            const SizedBox(height: Space.sm),
            ProgressBar(
              value: lesson.progress,
              semanticLabel: lesson.title,
            ),
          ],
          const SizedBox(height: Space.sm),
          Wrap(
            spacing: Space.sm,
            runSpacing: Space.xxs,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                l10n.lessonMeta(lesson.minutes, lesson.questionCount),
                style: context.type.footnote,
              ),
              Text(
                l10n.lessonReward(lesson.xpReward),
                style: context.type.footnote.copyWith(
                  color: c.accentText,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (lesson.isComplete)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      LucideIcons.circleCheck,
                      size: 14,
                      color: c.success,
                    ),
                    const SizedBox(width: Space.xxs),
                    Text(
                      l10n.lessonDone,
                      style: context.type.footnote.copyWith(color: c.success),
                    ),
                  ],
                )
              else if (lesson.isStarted)
                Text(
                  l10n.lessonInProgress((lesson.progress * 100).round()),
                  style: context.type.footnote,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
