import 'package:civicos/app/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// Initials avatar. Photo avatars arrive with profiles in Phase 2.
class Avatar extends StatelessWidget {
  const Avatar({required this.name, super.key, this.size = 40});

  final String name;
  final double size;

  /// Up to two initials from the first and last words of [name].
  static String initialsOf(String name) {
    final words = name
        .trim()
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .toList();
    if (words.isEmpty) return '?';
    final first = words.first.characters.first;
    final last = words.length > 1 ? words.last.characters.first : '';
    return (first + last).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.civic;
    return ExcludeSemantics(
      child: SizedBox.square(
        dimension: size,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: c.accentWash,
            shape: BoxShape.circle,
            border: Border.all(color: c.border),
          ),
          child: Center(
            child: MediaQuery.withNoTextScaling(
              child: Text(
                initialsOf(name),
                style: context.type.headline.copyWith(
                  fontSize: size * 0.38,
                  height: 1,
                  color: c.accentText,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
