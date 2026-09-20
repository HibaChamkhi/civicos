import 'package:civicos/features/learning/domain/lesson.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

String lessonTopicLabel(AppLocalizations l10n, LessonTopic topic) {
  return switch (topic) {
    LessonTopic.environment => l10n.topicEnvironment,
    LessonTopic.firstAid => l10n.topicFirstAid,
    LessonTopic.civic => l10n.topicCivic,
    LessonTopic.digital => l10n.topicDigital,
    LessonTopic.sustainability => l10n.topicSustainability,
    LessonTopic.money => l10n.topicMoney,
  };
}

IconData lessonTopicIcon(LessonTopic topic) {
  return switch (topic) {
    LessonTopic.environment => LucideIcons.leaf,
    LessonTopic.firstAid => LucideIcons.bandage,
    LessonTopic.civic => LucideIcons.landmark,
    LessonTopic.digital => LucideIcons.laptop,
    LessonTopic.sustainability => LucideIcons.recycle,
    LessonTopic.money => LucideIcons.wallet,
  };
}
