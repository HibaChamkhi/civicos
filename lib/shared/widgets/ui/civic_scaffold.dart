import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:flutter/material.dart';

/// Standard screen: a slim toolbar (back button and actions), a large title
/// that wraps at any text size, then scrolling content.
class CivicScaffold extends StatelessWidget {
  const CivicScaffold({
    required this.title,
    required this.children,
    super.key,
    this.subtitle,
    this.actions = const [],
  });

  final String title;
  final String? subtitle;
  final List<Widget> children;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final subtitle = this.subtitle;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            actions: [
              ...actions,
              const SizedBox(width: Space.xs),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              Space.gutter,
              Space.xxs,
              Space.gutter,
              0,
            ),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Semantics(
                    header: true,
                    child: Text(title, style: context.type.title1),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: Space.xxs),
                    Text(
                      subtitle,
                      style: context.type.callout.copyWith(
                        color: context.civic.textMuted,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          SliverSafeArea(
            top: false,
            sliver: SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                Space.gutter,
                Space.xs,
                Space.gutter,
                Space.xxl,
              ),
              sliver: SliverList.list(children: children),
            ),
          ),
        ],
      ),
    );
  }
}
