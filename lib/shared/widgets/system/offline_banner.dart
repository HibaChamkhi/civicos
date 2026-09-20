import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:civicos/core/network/connectivity.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Wraps the whole app. When the device goes offline, a banner slides in
/// above every screen and the screen below gives up the top safe area.
class ConnectivityGate extends ConsumerWidget {
  const ConnectivityGate({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Unknown (still checking, or the check failed) counts as online so the
    // banner never flashes on launch.
    final offline = ref.watch(isOnlineProvider).value == false;
    return Column(
      children: [
        AnimatedSize(
          duration: MediaQuery.disableAnimationsOf(context)
              ? Duration.zero
              : Motion.base,
          curve: Motion.standard,
          child: offline
              ? const OfflineBanner()
              : const SizedBox(width: double.infinity),
        ),
        Expanded(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: offline,
            child: child,
          ),
        ),
      ],
    );
  }
}

class OfflineBanner extends StatelessWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.civic;
    return Semantics(
      liveRegion: true,
      container: true,
      child: Material(
        color: c.text,
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Space.gutter,
              vertical: Space.sm,
            ),
            child: Row(
              children: [
                Icon(LucideIcons.wifiOff, size: 18, color: c.background),
                const SizedBox(width: Space.sm),
                Expanded(
                  child: Text(
                    context.l10n.offlineBanner,
                    style: context.type.callout.copyWith(color: c.background),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
