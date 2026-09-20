import 'package:civicos/features/volunteering/domain/opportunity.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

String impactCategoryLabel(AppLocalizations l10n, ImpactCategory category) {
  return switch (category) {
    ImpactCategory.environment => l10n.categoryEnvironment,
    ImpactCategory.education => l10n.categoryEducation,
    ImpactCategory.social => l10n.categorySocial,
    ImpactCategory.health => l10n.categoryHealth,
    ImpactCategory.digital => l10n.categoryDigital,
  };
}

IconData impactCategoryIcon(ImpactCategory category) {
  return switch (category) {
    ImpactCategory.environment => LucideIcons.leaf,
    ImpactCategory.education => LucideIcons.graduationCap,
    ImpactCategory.social => LucideIcons.heartHandshake,
    ImpactCategory.health => LucideIcons.heartPulse,
    ImpactCategory.digital => LucideIcons.laptop,
  };
}

String difficultyLabel(AppLocalizations l10n, Difficulty difficulty) {
  return switch (difficulty) {
    Difficulty.beginner => l10n.difficultyBeginner,
    Difficulty.intermediate => l10n.difficultyIntermediate,
    Difficulty.advanced => l10n.difficultyAdvanced,
  };
}
