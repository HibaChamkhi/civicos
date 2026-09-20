import 'package:civicos/app/theme/tone.dart';
import 'package:civicos/core/errors/app_failure.dart';
import 'package:civicos/shared/widgets/system/error_state.dart';
import 'package:civicos/shared/widgets/ui/avatar.dart';
import 'package:civicos/shared/widgets/ui/civic_button.dart';
import 'package:civicos/shared/widgets/ui/civic_chip.dart';
import 'package:civicos/shared/widgets/ui/civic_text_field.dart';
import 'package:civicos/shared/widgets/ui/empty_state.dart';
import 'package:civicos/shared/widgets/ui/progress_bar.dart';
import 'package:civicos/shared/widgets/ui/status_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('CivicButton', () {
    testWidgets('calls onPressed when tapped', (tester) async {
      var taps = 0;
      await pumpThemed(
        tester,
        CivicButton(label: 'Join cleanup', onPressed: () => taps++),
      );

      await tester.tap(find.text('Join cleanup'));
      expect(taps, 1);
    });

    testWidgets('blocks taps and announces loading', (tester) async {
      final semantics = tester.ensureSemantics();
      var taps = 0;
      await pumpThemed(
        tester,
        CivicButton(label: 'Save', isLoading: true, onPressed: () => taps++),
      );

      await tester.tap(find.byType(CivicButton));
      expect(taps, 0);
      expect(find.bySemanticsLabel('Save, Loading'), findsOneWidget);
      semantics.dispose();
    });

    testWidgets('reports disabled state to screen readers', (tester) async {
      final semantics = tester.ensureSemantics();
      await pumpThemed(
        tester,
        const CivicButton(label: 'Submit', onPressed: null),
      );

      expect(
        tester.getSemantics(find.byType(CivicButton)),
        isSemantics(
          label: 'Submit',
          isButton: true,
          hasEnabledState: true,
          isEnabled: false,
        ),
      );
      semantics.dispose();
    });

    testWidgets('meets the 48dp touch target', (tester) async {
      await pumpThemed(
        tester,
        CivicButton(
          label: 'Go',
          size: CivicButtonSize.compact,
          onPressed: () {},
        ),
      );
      final size = tester.getSize(find.byType(Material).last);
      expect(size.height, greaterThanOrEqualTo(48));
      expect(size.width, greaterThanOrEqualTo(48));
    });
  });

  group('CivicTextField', () {
    testWidgets('shows its label and error message', (tester) async {
      await pumpThemed(
        tester,
        const CivicTextField(
          label: 'Email',
          errorText: 'Check the email address.',
        ),
      );

      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Check the email address.'), findsOneWidget);
    });

    testWidgets('password fields can be revealed and hidden', (tester) async {
      await pumpThemed(
        tester,
        const CivicTextField(label: 'Password', obscureText: true),
      );

      EditableText field() => tester.widget(find.byType(EditableText));
      expect(field().obscureText, isTrue);

      await tester.tap(find.byTooltip('Show password'));
      await tester.pump();
      expect(field().obscureText, isFalse);
      expect(find.byTooltip('Hide password'), findsOneWidget);
    });
  });

  group('StatusBadge', () {
    testWidgets('reads its status and lifecycle step aloud', (tester) async {
      final semantics = tester.ensureSemantics();
      await pumpThemed(
        tester,
        const StatusBadge(
          label: 'In progress',
          icon: LucideIcons.hammer,
          tone: Tone.accent,
          step: 5,
          totalSteps: 6,
        ),
      );

      expect(
        find.bySemanticsLabel('Status: In progress, step 5 of 6'),
        findsOneWidget,
      );
      semantics.dispose();
    });

    testWidgets('works without a step', (tester) async {
      final semantics = tester.ensureSemantics();
      await pumpThemed(
        tester,
        const StatusBadge(
          label: 'Declined',
          icon: LucideIcons.circleX,
          tone: Tone.danger,
        ),
      );

      expect(find.bySemanticsLabel('Status: Declined'), findsOneWidget);
      semantics.dispose();
    });
  });

  group('EmptyState', () {
    testWidgets('shows copy and runs its action', (tester) async {
      var tapped = false;
      await pumpThemed(
        tester,
        EmptyState(
          icon: LucideIcons.inbox,
          title: "You're all caught up",
          body: 'Nothing new.',
          actionLabel: 'Back to Home',
          onAction: () => tapped = true,
        ),
      );

      expect(find.text("You're all caught up"), findsOneWidget);
      await tester.tap(find.text('Back to Home'));
      expect(tapped, isTrue);
    });

    testWidgets('hides the button when there is no action', (tester) async {
      await pumpThemed(
        tester,
        const EmptyState(
          icon: LucideIcons.inbox,
          title: 'Nothing here',
          body: 'Check back later.',
        ),
      );

      expect(find.byType(CivicButton), findsNothing);
    });
  });

  group('ErrorState', () {
    testWidgets('offers a retry for network failures', (tester) async {
      var retried = false;
      await pumpThemed(
        tester,
        ErrorState(
          failure: const NetworkFailure(),
          onRetry: () => retried = true,
        ),
      );

      expect(
        find.text("Can't reach CivicOS. Check your connection and try again."),
        findsOneWidget,
      );
      await tester.tap(find.text('Try again'));
      expect(retried, isTrue);
    });

    testWidgets('does not offer a retry that cannot help', (tester) async {
      await pumpThemed(
        tester,
        ErrorState(failure: const PermissionFailure(), onRetry: () {}),
      );

      expect(find.text('Try again'), findsNothing);
    });
  });

  group('CivicChip', () {
    testWidgets('toggles and exposes its selected state', (tester) async {
      final semantics = tester.ensureSemantics();
      bool? next;
      await pumpThemed(
        tester,
        CivicChip(
          label: 'Environment',
          selected: true,
          onSelected: (value) => next = value,
        ),
      );

      expect(
        tester.getSemantics(find.byType(CivicChip)),
        isSemantics(label: 'Environment', isSelected: true),
      );
      await tester.tap(find.byType(CivicChip));
      expect(next, isFalse);
      semantics.dispose();
    });
  });

  group('ProgressBar', () {
    testWidgets('announces a rounded, clamped percentage', (tester) async {
      final semantics = tester.ensureSemantics();
      await pumpThemed(
        tester,
        const ProgressBar(value: 1.4, semanticLabel: 'Level progress'),
      );
      await tester.pumpAndSettle();

      expect(
        find.bySemanticsLabel('Level progress, 100 percent'),
        findsOneWidget,
      );
      semantics.dispose();
    });
  });

  group('Avatar.initialsOf', () {
    test('uses first and last initials', () {
      expect(Avatar.initialsOf('Amine Ben Salah'), 'AS');
      expect(Avatar.initialsOf('sara'), 'S');
      expect(Avatar.initialsOf('  '), '?');
      expect(Avatar.initialsOf('élodie martin'), 'ÉM');
    });
  });
}
