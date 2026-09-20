import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Says plainly that the figures on screen are stand-in content, so nothing
/// here is mistaken for the person's own record. It disappears in Step 2,
/// when the screens read from the server.
class SampleDataNotice extends StatelessWidget {
  const SampleDataNotice({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.civic;
    return Container(
      margin: const EdgeInsets.only(top: Space.md),
      padding: const EdgeInsets.symmetric(
        horizontal: Space.sm,
        vertical: Space.xs,
      ),
      decoration: BoxDecoration(
        color: c.surfaceSunken,
        borderRadius: BorderRadius.circular(Radii.sm),
        border: Border.all(color: c.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(LucideIcons.info, size: 16, color: c.textMuted),
          const SizedBox(width: Space.xs),
          Expanded(
            child: Text(
              context.l10n.sampleDataNotice,
              style: context.type.footnote,
            ),
          ),
        ],
      ),
    );
  }
}
