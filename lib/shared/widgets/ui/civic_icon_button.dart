import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:flutter/material.dart';

/// Icon-only button. [semanticLabel] is required because an icon alone
/// tells a screen-reader user nothing; it also shows as a tooltip.
class CivicIconButton extends StatelessWidget {
  const CivicIconButton({
    required this.icon,
    required this.semanticLabel,
    required this.onPressed,
    super.key,
  });

  final IconData icon;
  final String semanticLabel;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      tooltip: semanticLabel,
      icon: Icon(icon, size: 22),
      style: IconButton.styleFrom(
        foregroundColor: context.civic.text,
        minimumSize: const Size.square(Sizes.minTouchTarget),
      ),
    );
  }
}
