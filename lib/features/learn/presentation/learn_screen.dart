import 'package:civicos/app/router/routes.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:civicos/features/learning/data/learning_repository.dart';
import 'package:civicos/features/learning/domain/lesson.dart';
import 'package:civicos/features/learning/presentation/widgets/lesson_card.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:civicos/shared/widgets/system/async_value_view.dart';
import 'package:civicos/shared/widgets/ui/civic_scaffold.dart';
import 'package:civicos/shared/widgets/ui/empty_state.dart';
import 'package:civicos/shared/widgets/ui/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Short lessons, with the one you're part-way through offered first.
class LearnScreen extends ConsumerWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final next = ref.watch(lessonToContinueProvider).value;

    return CivicScaffold(
      title: l10n.learnTitle,
      children: [
        if (next != null) ...[
          SectionHeader(l10n.learnContinue),
          LessonCard(lesson: next),
        ],
        SectionHeader(l10n.learnAllLessons),
        AsyncValueView<List<Lesson>>(
          value: ref.watch(lessonsProvider),
          isEmpty: (items) => items.isEmpty,
          onRetry: () => ref.invalidate(lessonsProvider),
          empty: EmptyState(
            icon: LucideIcons.bookOpen,
            title: l10n.learnEmptyTitle,
            body: l10n.learnEmptyBody,
            actionLabel: l10n.learnEmptyAction,
            onAction: () => const YouRoute().go(context),
          ),
          data: (lessons) => Column(
            children: [
              for (final lesson in lessons)
                Padding(
                  padding: const EdgeInsets.only(bottom: Space.sm),
                  child: LessonCard(lesson: lesson),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
