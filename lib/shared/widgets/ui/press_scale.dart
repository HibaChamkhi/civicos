import 'package:civicos/app/theme/tokens.dart';
import 'package:flutter/widgets.dart';

/// Shrinks its child slightly while pressed. Does nothing when the system
/// asks for fewer animations.
class PressScale extends StatefulWidget {
  const PressScale({required this.child, super.key, this.enabled = true});

  final Widget child;
  final bool enabled;

  @override
  State<PressScale> createState() => _PressScaleState();
}

class _PressScaleState extends State<PressScale> {
  bool _pressed = false;

  void _setPressed({required bool pressed}) {
    if (_pressed != pressed) setState(() => _pressed = pressed);
  }

  @override
  Widget build(BuildContext context) {
    final reduceMotion = MediaQuery.disableAnimationsOf(context);
    if (reduceMotion || !widget.enabled) return widget.child;
    return Listener(
      onPointerDown: (_) => _setPressed(pressed: true),
      onPointerUp: (_) => _setPressed(pressed: false),
      onPointerCancel: (_) => _setPressed(pressed: false),
      child: AnimatedScale(
        scale: _pressed ? Motion.pressedScale : 1,
        duration: Motion.fast,
        curve: Motion.standard,
        child: widget.child,
      ),
    );
  }
}
