import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:civicos/shared/widgets/ui/press_scale.dart';
import 'package:flutter/material.dart';

enum CivicButtonVariant { primary, secondary, ghost, danger }

enum CivicButtonSize { regular, compact }

/// The design-system button. One primary button per screen.
class CivicButton extends StatelessWidget {
  const CivicButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.variant = CivicButtonVariant.primary,
    this.size = CivicButtonSize.regular,
    this.icon,
    this.isLoading = false,
    this.expand = false,
  });

  final String label;

  /// `null` disables the button.
  final VoidCallback? onPressed;
  final CivicButtonVariant variant;
  final CivicButtonSize size;
  final IconData? icon;

  /// Shows a spinner, blocks taps, and tells screen readers it's loading.
  final bool isLoading;

  /// Fill the available width.
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final c = context.civic;
    final enabled = onPressed != null && !isLoading;

    final (
      Color background,
      Color foreground,
      BorderSide side,
    ) = switch (variant) {
      CivicButtonVariant.primary => (
        c.primary,
        c.onPrimary,
        BorderSide.none,
      ),
      CivicButtonVariant.secondary => (
        c.surface,
        c.text,
        BorderSide(color: c.borderStrong, width: 1.5),
      ),
      CivicButtonVariant.ghost => (
        Colors.transparent,
        c.text,
        BorderSide.none,
      ),
      CivicButtonVariant.danger => (c.danger, c.surface, BorderSide.none),
    };

    final isGhost = variant == CivicButtonVariant.ghost;
    final minHeight = size == CivicButtonSize.regular
        ? 52.0
        : Sizes.minTouchTarget;
    final textStyle = context.type.button.copyWith(
      color: foreground,
      decoration: isGhost ? TextDecoration.underline : null,
      decorationColor: c.accent,
      decorationThickness: 2,
    );

    final content = Row(
      mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading)
          SizedBox.square(
            dimension: 18,
            child: CircularProgressIndicator(
              strokeWidth: 2.2,
              color: foreground,
            ),
          )
        else if (icon != null)
          Icon(icon, size: 20, color: foreground),
        if (isLoading || icon != null) const SizedBox(width: Space.xs),
        Flexible(
          child: Text(label, style: textStyle, textAlign: TextAlign.center),
        ),
      ],
    );

    final semanticLabel = isLoading ? '$label, ${context.l10n.loading}' : label;

    return Semantics(
      container: true,
      button: true,
      enabled: enabled,
      label: semanticLabel,
      onTap: enabled ? onPressed : null,
      excludeSemantics: true,
      child: Opacity(
        opacity: onPressed == null && !isLoading ? 0.45 : 1,
        child: PressScale(
          enabled: enabled,
          child: Material(
            color: background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Radii.md),
              side: side,
            ),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: enabled ? onPressed : null,
              focusColor: c.accent.withValues(alpha: 0.35),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: minHeight,
                  minWidth: Sizes.minTouchTarget,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isGhost ? Space.xs : Space.lg,
                    vertical: Space.sm,
                  ),
                  child: Center(widthFactor: 1, child: content),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
