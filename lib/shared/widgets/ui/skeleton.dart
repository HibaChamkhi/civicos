import 'dart:async';

import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:flutter/material.dart';

/// Placeholder block shown while content loads. Pulses gently, and holds
/// still when the system asks for fewer animations.
class Skeleton extends StatefulWidget {
  const Skeleton({super.key, this.width, this.height = 16, this.radius});

  final double? width;
  final double height;
  final double? radius;

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.disableAnimationsOf(context)) {
      _controller
        ..stop()
        ..value = 1;
    } else if (!_controller.isAnimating) {
      // Runs until disposed; the returned TickerFuture never completes.
      unawaited(_controller.repeat(reverse: true));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: FadeTransition(
        opacity: Tween<double>(begin: 0.45, end: 1).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
        ),
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: context.civic.surfaceSunken,
            borderRadius: BorderRadius.circular(widget.radius ?? Radii.sm),
          ),
        ),
      ),
    );
  }
}
