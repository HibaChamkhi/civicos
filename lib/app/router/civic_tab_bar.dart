import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:flutter/material.dart';

@immutable
class CivicTabItem {
  const CivicTabItem({required this.icon, required this.label});

  final IconData icon;
  final String label;
}

/// A floating tab dock. A honey pill (like a road marking) glides to the
/// selected tab and its icon lifts. Labels always stay visible, and the
/// motion turns off when the system asks for fewer animations.
class CivicTabBar extends StatelessWidget {
  const CivicTabBar({
    required this.items,
    required this.currentIndex,
    required this.onSelected,
    super.key,
  });

  final List<CivicTabItem> items;
  final int currentIndex;
  final ValueChanged<int> onSelected;

  static const double height = 68;
  static const double _pillInset = 6;

  @override
  Widget build(BuildContext context) {
    final c = context.civic;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final reduceMotion = MediaQuery.disableAnimationsOf(context);

    return SafeArea(
      top: false,
      minimum: const EdgeInsets.only(bottom: Space.sm),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Space.md),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: c.surface,
            borderRadius: BorderRadius.circular(Radii.dock),
            border: Border.all(color: c.border),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.45 : 0.08),
                blurRadius: 28,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: SizedBox(
            height: height,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final slotWidth = constraints.maxWidth / items.length;
                return Stack(
                  children: [
                    AnimatedPositionedDirectional(
                      duration: reduceMotion ? Duration.zero : Motion.slow,
                      curve: Motion.glide,
                      start: slotWidth * currentIndex + _pillInset,
                      top: _pillInset,
                      bottom: _pillInset,
                      width: slotWidth - _pillInset * 2,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: c.accent,
                          borderRadius: BorderRadius.circular(
                            Radii.dock - _pillInset,
                          ),
                        ),
                      ),
                    ),
                    Material(
                      type: MaterialType.transparency,
                      child: Row(
                        children: [
                          for (var i = 0; i < items.length; i++)
                            Expanded(
                              child: _TabSlot(
                                item: items[i],
                                index: i,
                                count: items.length,
                                selected: i == currentIndex,
                                onTap: () => onSelected(i),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _TabSlot extends StatelessWidget {
  const _TabSlot({
    required this.item,
    required this.index,
    required this.count,
    required this.selected,
    required this.onTap,
  });

  final CivicTabItem item;
  final int index;
  final int count;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.civic;
    final reduceMotion = MediaQuery.disableAnimationsOf(context);
    final duration = reduceMotion ? Duration.zero : Motion.base;
    final color = selected ? c.onAccent : c.textMuted;
    final position = MaterialLocalizations.of(
      context,
    ).tabLabel(tabIndex: index + 1, tabCount: count);

    return Semantics(
      container: true,
      button: true,
      selected: selected,
      label: '${item.label}, $position',
      onTap: onTap,
      excludeSemantics: true,
      child: InkResponse(
        onTap: onTap,
        radius: 34,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSlide(
              offset: selected && !reduceMotion
                  ? const Offset(0, -0.08)
                  : Offset.zero,
              duration: duration,
              curve: Curves.easeOutBack,
              child: TweenAnimationBuilder<Color?>(
                tween: ColorTween(end: color),
                duration: duration,
                builder: (context, animated, _) =>
                    Icon(item.icon, size: 22, color: animated),
              ),
            ),
            const SizedBox(height: 3),
            AnimatedDefaultTextStyle(
              duration: duration,
              style: context.type.tabLabel.copyWith(
                color: color,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(item.label, maxLines: 1, softWrap: false),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
